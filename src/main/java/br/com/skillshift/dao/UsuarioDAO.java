package br.com.skillshift.dao;

import java.util.List;
import java.util.Optional;

import br.com.skillshift.model.Usuario;

public interface UsuarioDAO {

    List<Usuario> listarTodos();

    Optional<Usuario> buscarPorId(Long id);

    Optional<Usuario> buscarPorEmail(String email);

    Usuario criar(Usuario usuario);

    void atualizar(Usuario usuario);

    void deletar(Long id);
}
