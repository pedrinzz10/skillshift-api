package br.com.skillshift.bo;

import java.time.LocalDate;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;

import br.com.skillshift.dao.CursoDAO;
import br.com.skillshift.dao.RecomendacaoDAO;
import br.com.skillshift.dao.UsuarioDAO;
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

    public List<Recomendacao> gerarSimulada(Long usuarioId) {
        Usuario usuario = usuarioDAO.buscarPorId(usuarioId)
                .orElseThrow(() -> new NoSuchElementException("Usuário não encontrado para recomendação"));
        List<Curso> cursos = cursoDAO.listarTodos();
        List<Curso> ativos = cursos.stream()
                .filter(c -> Boolean.TRUE.equals(c.getAtivo()))
                .collect(Collectors.toList());
        List<Curso> base = ativos.isEmpty() ? cursos : ativos;

        return base.stream()
                .limit(3)
                .map(curso -> criarSugestao(usuario, curso))
                .collect(Collectors.toList());
    }

    private Recomendacao criarSugestao(Usuario usuario, Curso curso) {
        Recomendacao recomendacao = new Recomendacao();
        recomendacao.setIdUsuario(usuario.getIdUsuario());
        recomendacao.setIdCurso(curso.getIdCurso());
        recomendacao.setScore(60 + ThreadLocalRandom.current().nextDouble(40));
        recomendacao.setFonte("IA");
        recomendacao.setStatus("PENDENTE");
        recomendacao.setDataRecomendacao(LocalDate.now());
        return recomendacao;
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
}
