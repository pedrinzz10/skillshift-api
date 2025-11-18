package br.com.skillshift.dao;

import java.util.List;
import java.util.Optional;

import br.com.skillshift.model.Recomendacao;

public interface RecomendacaoDAO {

    List<Recomendacao> listarTodos();

    List<Recomendacao> listarPorUsuario(Long usuarioId);

    Optional<Recomendacao> buscarPorId(Long id);

    Recomendacao criar(Recomendacao recomendacao);

    void atualizar(Recomendacao recomendacao);

    void deletar(Long id);
}
