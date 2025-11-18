package br.com.skillshift.bo;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

import br.com.skillshift.dao.EmpresaDAO;
import br.com.skillshift.model.Empresa;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class EmpresaBO {

    private static final Set<String> TAMANHOS_PERMITIDOS = Set.of("PEQUENA", "MEDIA", "GRANDE");

    @Inject
    EmpresaDAO empresaDAO;

    public List<Empresa> listar() {
        return empresaDAO.listarTodos();
    }

    public Empresa buscarPorId(Long id) {
        return empresaDAO.buscarPorId(id).orElseThrow(() -> new NoSuchElementException("Empresa não encontrada"));
    }

    public Empresa criar(Empresa empresa) {
        validarEmpresa(empresa);
        return empresaDAO.criar(empresa);
    }

    public Empresa atualizar(Long id, Empresa empresa) {
        validarEmpresa(empresa);
        buscarPorId(id);
        empresa.setIdEmpresa(id);
        empresaDAO.atualizar(empresa);
        return empresa;
    }

    public void deletar(Long id) {
        buscarPorId(id);
        empresaDAO.deletar(id);
    }

    private void validarEmpresa(Empresa empresa) {
        if (empresa == null) {
            throw new IllegalArgumentException("Empresa inválida");
        }
        if (isBlank(empresa.getNome())) {
            throw new IllegalArgumentException("Nome da empresa é obrigatório");
        }
        if (isBlank(empresa.getCnpj())) {
            throw new IllegalArgumentException("CNPJ é obrigatório");
        }
        if (!isBlank(empresa.getTamanho())) {
            String upper = empresa.getTamanho().toUpperCase();
            if (!TAMANHOS_PERMITIDOS.contains(upper)) {
                throw new IllegalArgumentException("Tamanho inválido");
            }
            empresa.setTamanho(upper);
        } else {
            empresa.setTamanho(null);
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
