package br.com.skillshift.bo;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

import br.com.skillshift.dao.CursoDAO;
import br.com.skillshift.model.Curso;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class CursoBO {

    private static final Set<String> NIVEIS_PERMITIDOS = Set.of("INICIAL", "INTERMEDIARIO", "AVANCADO");

    @Inject
    CursoDAO cursoDAO;

    public List<Curso> listar() {
        return cursoDAO.listarTodos();
    }

    public Curso buscarPorId(Long id) {
        return cursoDAO.buscarPorId(id).orElseThrow(() -> new NoSuchElementException("Curso não encontrado"));
    }

    public Curso criar(Curso curso) {
        validarCurso(curso);
        return cursoDAO.criar(curso);
    }

    public Curso atualizar(Long id, Curso curso) {
        validarCurso(curso);
        buscarPorId(id);
        curso.setIdCurso(id);
        cursoDAO.atualizar(curso);
        return curso;
    }

    public void deletar(Long id) {
        buscarPorId(id);
        cursoDAO.deletar(id);
    }

    private void validarCurso(Curso curso) {
        if (curso == null) {
            throw new IllegalArgumentException("Curso inválido");
        }
        if (isBlank(curso.getNome())) {
            throw new IllegalArgumentException("Nome do curso é obrigatório");
        }
        if (isBlank(curso.getCategoria())) {
            throw new IllegalArgumentException("Categoria é obrigatória");
        }
        if (curso.getDuracaoHoras() != null && curso.getDuracaoHoras() <= 0) {
            throw new IllegalArgumentException("Duração inválida");
        }
        if (!isBlank(curso.getNivel())) {
            String upper = curso.getNivel().toUpperCase();
            if (!NIVEIS_PERMITIDOS.contains(upper)) {
                throw new IllegalArgumentException("Nível inválido");
            }
            curso.setNivel(upper);
        } else {
            curso.setNivel(null);
        }
        if (curso.getAtivo() == null) {
            curso.setAtivo(Boolean.TRUE);
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
