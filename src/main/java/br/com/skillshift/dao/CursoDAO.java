package br.com.skillshift.dao;

import java.util.List;
import java.util.Optional;

import br.com.skillshift.model.Curso;

public interface CursoDAO {

    List<Curso> listarTodos();

    Optional<Curso> buscarPorId(Long id);

    Curso criar(Curso curso);

    void atualizar(Curso curso);

    void deletar(Long id);

    List<Curso> buscarPorNomeLike(String nome);

    Optional<Curso> buscarPorAlias(String termo);
}
