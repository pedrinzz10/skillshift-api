package br.com.skillshift.resource;

import br.com.skillshift.bo.AuthBO;
import br.com.skillshift.model.Usuario;
import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/auth")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AuthResource {

    @Inject
    AuthBO authBO;

    @POST
    @Path("/login")
    public Response login(LoginRequest request) {
        if (request == null || request.email == null || request.senha == null) {
            return Response.status(Response.Status.BAD_REQUEST).entity(new Mensagem("Email e senha são obrigatórios"))
                    .build();
        }
        try {
            AuthBO.AuthResponse auth = authBO.login(request.email, request.senha);
            return Response.ok(new LoginResponse(auth.token(), auth.usuario())).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST).entity(new Mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity(new Mensagem("Erro interno: " + e.getMessage()))
                    .build();
        }
    }

    public record LoginRequest(String email, String senha) {
    }

    public record LoginResponse(String token, Usuario usuario) {
    }

    public record Mensagem(String mensagem) {
    }
}
