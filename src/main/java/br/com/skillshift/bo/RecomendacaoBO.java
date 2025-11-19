package br.com.skillshift.bo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

import org.eclipse.microprofile.rest.client.inject.RestClient;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.skillshift.client.IAClient;
import br.com.skillshift.dao.CursoDAO;
import br.com.skillshift.dao.RecomendacaoDAO;
import br.com.skillshift.dao.RecomendacaoLogDAO;
import br.com.skillshift.dao.UsuarioDAO;
import br.com.skillshift.dto.IAEntradaPerfil;
import br.com.skillshift.dto.IARetornoCluster;
import br.com.skillshift.exception.IAServiceIndisponivelException;
import br.com.skillshift.model.Curso;
import br.com.skillshift.model.Recomendacao;
import br.com.skillshift.model.Usuario;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class RecomendacaoBO {

    private static final Set<String> FONTES_PERMITIDAS = Set.of("IA", "EMPRESA", "MANUAL");
    private static final Set<String> STATUS_PERMITIDOS = Set.of("PENDENTE", "EM_ANDAMENTO", "CONCLUIDA");

    @Inject
    RecomendacaoDAO recomendacaoDAO;

    @Inject
    UsuarioDAO usuarioDAO;

    @Inject
    CursoDAO cursoDAO;

    @Inject
    @RestClient
    IAClient iaClient;

    @Inject
    RecomendacaoLogDAO recomendacaoLogDAO;

    @Inject
    ObjectMapper objectMapper;

    public List<Recomendacao> listar(Long usuarioId) {
        if (usuarioId != null) {
            return recomendacaoDAO.listarPorUsuario(usuarioId);
        }
        return recomendacaoDAO.listarTodos();
    }

    public Recomendacao buscarPorId(Long id) {
        return recomendacaoDAO.buscarPorId(id)
                .orElseThrow(() -> new NoSuchElementException("Recomendação não encontrada"));
    }

    public Recomendacao criar(Recomendacao recomendacao) {
        validarRecomendacao(recomendacao);
        garantirRelacionamentos(recomendacao);
        if (recomendacao.getDataRecomendacao() == null) {
            recomendacao.setDataRecomendacao(LocalDate.now());
        }
        return recomendacaoDAO.criar(recomendacao);
    }

    public Recomendacao atualizar(Long id, Recomendacao recomendacao) {
        validarRecomendacao(recomendacao);
        buscarPorId(id);
        recomendacao.setIdRecomendacao(id);
        garantirRelacionamentos(recomendacao);
        if (recomendacao.getDataRecomendacao() == null) {
            recomendacao.setDataRecomendacao(LocalDate.now());
        }
        recomendacaoDAO.atualizar(recomendacao);
        return recomendacao;
    }

    public void deletar(Long id) {
        buscarPorId(id);
        recomendacaoDAO.deletar(id);
    }

    public List<Recomendacao> gerarRecomendacoes(Long usuarioId) {
        Usuario usuario = usuarioDAO.buscarPorId(usuarioId)
                .orElseThrow(() -> new NoSuchElementException("Usuário não encontrado para recomendação"));
        IAEntradaPerfil entrada = montarEntradaPerfil(usuario);
        String payloadEnvio = toJson(entrada);
        IARetornoCluster retorno;
        String payloadRetorno = null;
        Integer cluster = null;
        try {
            retorno = iaClient.gerarPerfil(entrada);
            payloadRetorno = toJson(retorno);
            cluster = retorno != null ? retorno.getCluster() : null;
            recomendacaoLogDAO.registrar(usuarioId, cluster, payloadEnvio, payloadRetorno, "SUCESSO", null);
        } catch (Exception e) {
            recomendacaoLogDAO.registrar(usuarioId, null, payloadEnvio, null, "ERRO", e.getMessage());
            throw new IAServiceIndisponivelException("Serviço de IA indisponível", e);
        }
        if (retorno == null || retorno.getCursosRecomendados() == null) {
            return List.of();
        }
        List<Recomendacao> criadas = new ArrayList<>();
        for (String nomeCurso : retorno.getCursosRecomendados()) {
            if (nomeCurso == null || nomeCurso.isBlank()) {
                continue;
            }
            List<Curso> cursos = cursoDAO.buscarPorNomeLike(nomeCurso);
            Curso curso = cursos.isEmpty() ? cursoDAO.buscarPorAlias(nomeCurso).orElse(null) : cursos.get(0);
            if (curso == null) {
                continue;
            }
            Recomendacao recomendacao = new Recomendacao();
            recomendacao.setIdUsuario(usuarioId);
            recomendacao.setIdCurso(curso.getIdCurso());
            recomendacao.setScore(70 + ThreadLocalRandom.current().nextDouble(25));
            recomendacao.setFonte("IA");
            recomendacao.setStatus("PENDENTE");
            recomendacao.setDataRecomendacao(LocalDate.now());
            recomendacao.setCluster(cluster);
            recomendacao.setPayloadIa(payloadRetorno);
            criadas.add(recomendacaoDAO.criar(recomendacao));
        }
        return criadas;
    }

    private IAEntradaPerfil montarEntradaPerfil(Usuario usuario) {
        IAEntradaPerfil entrada = new IAEntradaPerfil();
        double risco = valorOuPadrao(usuario.getNivelRisco(), 50.0);
        double idade = valorOuPadrao(usuario.getIdade(), 30.0);
        double escolaridade = usuario.getEscolaridade() == null ? 50.0 : Math.min(100, usuario.getEscolaridade().length() * 4.0);
        entrada.setOpScore(normalizar(risco));
        entrada.setCoScore(normalizar(100 - risco));
        entrada.setExScore(normalizar(idade * 2));
        entrada.setAgScore(normalizar(80 - risco / 2));
        entrada.setNeScore(normalizar(risco / 2 + idade));
        entrada.setRaciocinioScore(normalizar(risco + escolaridade / 2));
        entrada.setProblemasScore(normalizar(risco + 10));
        entrada.setColabScore(normalizar(70 + escolaridade / 3));
        entrada.setAdaptScore(normalizar(60 + idade / 2));
        entrada.setEducScore(normalizar(escolaridade));
        return entrada;
    }

    private double valorOuPadrao(Number valor, double padrao) {
        return valor == null ? padrao : valor.doubleValue();
    }

    private double normalizar(double valor) {
        return Math.max(0, Math.min(100, valor));
    }

    private void garantirRelacionamentos(Recomendacao recomendacao) {
        usuarioDAO.buscarPorId(recomendacao.getIdUsuario())
                .orElseThrow(() -> new IllegalArgumentException("Usuário não existe"));
        cursoDAO.buscarPorId(recomendacao.getIdCurso())
                .orElseThrow(() -> new IllegalArgumentException("Curso não existe"));
    }

    private void validarRecomendacao(Recomendacao recomendacao) {
        if (recomendacao == null) {
            throw new IllegalArgumentException("Recomendação inválida");
        }
        if (recomendacao.getIdUsuario() == null) {
            throw new IllegalArgumentException("Usuário é obrigatório");
        }
        if (recomendacao.getIdCurso() == null) {
            throw new IllegalArgumentException("Curso é obrigatório");
        }
        if (recomendacao.getScore() == null) {
            throw new IllegalArgumentException("Score é obrigatório");
        }
        if (recomendacao.getScore() < 0 || recomendacao.getScore() > 100) {
            throw new IllegalArgumentException("Score deve estar entre 0 e 100");
        }
        if (isBlank(recomendacao.getFonte())) {
            throw new IllegalArgumentException("Fonte é obrigatória");
        }
        String fonte = recomendacao.getFonte().toUpperCase();
        if (!FONTES_PERMITIDAS.contains(fonte)) {
            throw new IllegalArgumentException("Fonte inválida");
        }
        recomendacao.setFonte(fonte);
        if (isBlank(recomendacao.getStatus())) {
            recomendacao.setStatus("PENDENTE");
        }
        String status = recomendacao.getStatus().toUpperCase();
        if (!STATUS_PERMITIDOS.contains(status)) {
            throw new IllegalArgumentException("Status inválido");
        }
        recomendacao.setStatus(status);
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }

    private String toJson(Object objeto) {
        if (objeto == null) {
            return null;
        }
        try {
            return objectMapper.writeValueAsString(objeto);
        } catch (Exception e) {
            return null;
        }
    }
}
