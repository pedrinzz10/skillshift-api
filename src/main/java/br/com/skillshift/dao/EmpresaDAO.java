package br.com.skillshift.dao;

import java.util.List;
import java.util.Optional;

import br.com.skillshift.model.Empresa;

public interface EmpresaDAO {

    List<Empresa> listarTodos();

    Optional<Empresa> buscarPorId(Long id);

    Empresa criar(Empresa empresa);

    void atualizar(Empresa empresa);

    void deletar(Long id);
}
