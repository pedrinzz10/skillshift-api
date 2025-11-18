package br.com.skillshift.bo;

import br.com.skillshift.dao.UsuarioDAO;
import br.com.skillshift.model.Usuario;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class AuthBO {

    @Inject
    UsuarioDAO usuarioDAO;

    public AuthResponse login(String email, String senha) {
        if (isBlank(email) || isBlank(senha)) {
            throw new IllegalArgumentException("Email e senha são obrigatórios");
        }
        Usuario usuario = usuarioDAO.buscarPorEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("Credenciais inválidas"));
        if (!senha.equals(usuario.getSenhaHash())) {
            throw new IllegalArgumentException("Credenciais inválidas");
        }
        String token = "TOKEN-" + usuario.getIdUsuario();
        return new AuthResponse(token, usuario);
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }

    public record AuthResponse(String token, Usuario usuario) {
    }
}
