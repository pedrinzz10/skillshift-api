package br.com.skillshift.bo;

import java.time.LocalDate;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

import br.com.skillshift.dao.UsuarioDAO;
import br.com.skillshift.model.Usuario;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class UsuarioBO {

    private static final Set<String> TIPOS_PERFIL = Set.of("USER", "ADMIN", "EMPRESA");
    private static final int IDADE_MIN = 16;
    private static final int IDADE_MAX = 80;

    @Inject
    UsuarioDAO usuarioDAO;

    public List<Usuario> listar() {
        return usuarioDAO.listarTodos();
    }

    public Usuario buscarPorId(Long id) {
        return usuarioDAO.buscarPorId(id).orElseThrow(() -> new NoSuchElementException("Usuário não encontrado"));
    }

    public Usuario criar(Usuario usuario) {
        validarUsuario(usuario);
        usuarioDAO.buscarPorEmail(usuario.getEmail()).ifPresent(u -> {
            throw new IllegalArgumentException("Email já cadastrado");
        });
        if (usuario.getCriadoEm() == null) {
            usuario.setCriadoEm(LocalDate.now());
        }
        return usuarioDAO.criar(usuario);
    }

    public Usuario atualizar(Long id, Usuario usuario) {
        validarUsuario(usuario);
        Usuario existente = buscarPorId(id);
        usuarioDAO.buscarPorEmail(usuario.getEmail()).ifPresent(outro -> {
            if (!outro.getIdUsuario().equals(id)) {
                throw new IllegalArgumentException("Email já cadastrado");
            }
        });
        usuario.setIdUsuario(id);
        if (usuario.getCriadoEm() == null) {
            usuario.setCriadoEm(existente.getCriadoEm());
        }
        usuarioDAO.atualizar(usuario);
        return usuario;
    }

    public void deletar(Long id) {
        buscarPorId(id);
        usuarioDAO.deletar(id);
    }

    private void validarUsuario(Usuario usuario) {
        if (usuario == null) {
            throw new IllegalArgumentException("Usuário inválido");
        }
        if (isBlank(usuario.getNome())) {
            throw new IllegalArgumentException("Nome é obrigatório");
        }
        if (isBlank(usuario.getEmail())) {
            throw new IllegalArgumentException("Email é obrigatório");
        }
        if (isBlank(usuario.getSenhaHash())) {
            throw new IllegalArgumentException("Senha é obrigatória");
        }
        if (usuario.getIdade() == null) {
            throw new IllegalArgumentException("Idade é obrigatória");
        }
        if (usuario.getIdade() < IDADE_MIN || usuario.getIdade() > IDADE_MAX) {
            throw new IllegalArgumentException("Idade deve estar entre " + IDADE_MIN + " e " + IDADE_MAX);
        }
        if (isBlank(usuario.getEscolaridade())) {
            throw new IllegalArgumentException("Escolaridade é obrigatória");
        }
        if (isBlank(usuario.getAreaAtual())) {
            throw new IllegalArgumentException("Área atual é obrigatória");
        }
        if (isBlank(usuario.getTipoPerfil()) || !TIPOS_PERFIL.contains(usuario.getTipoPerfil().toUpperCase())) {
            throw new IllegalArgumentException("Tipo de perfil inválido");
        }
        if (usuario.getNivelRisco() == null) {
            usuario.setNivelRisco(0.0);
        } else if (usuario.getNivelRisco() < 0 || usuario.getNivelRisco() > 100) {
            throw new IllegalArgumentException("Nível de risco deve estar entre 0 e 100");
        }
        usuario.setTipoPerfil(usuario.getTipoPerfil().toUpperCase());
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
