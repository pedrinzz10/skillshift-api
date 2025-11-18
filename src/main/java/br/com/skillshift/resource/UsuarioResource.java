package br.com.skillshift.resource;

import java.util.NoSuchElementException;

import br.com.skillshift.bo.UsuarioBO;
import br.com.skillshift.model.Usuario;
import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/usuarios")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class UsuarioResource {

    @Inject
    UsuarioBO usuarioBO;

    @GET
    public Response listar() {
        try {
            return Response.ok(usuarioBO.listar()).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @GET
    @Path("/{id}")
    public Response buscarPorId(@PathParam("id") Long id) {
        try {
            Usuario usuario = usuarioBO.buscarPorId(id);
            return Response.ok(usuario).build();
        } catch (NoSuchElementException e) {
            return Response.status(Response.Status.NOT_FOUND).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @POST
    public Response criar(Usuario usuario) {
        try {
            Usuario criado = usuarioBO.criar(usuario);
            return Response.status(Response.Status.CREATED).entity(criado).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @PUT
    @Path("/{id}")
    public Response atualizar(@PathParam("id") Long id, Usuario usuario) {
        try {
            Usuario atualizado = usuarioBO.atualizar(id, usuario);
            return Response.ok(atualizado).build();
        } catch (NoSuchElementException e) {
            return Response.status(Response.Status.NOT_FOUND).entity(mensagem(e.getMessage())).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @DELETE
    @Path("/{id}")
    public Response deletar(@PathParam("id") Long id) {
        try {
            usuarioBO.deletar(id);
            return Response.noContent().build();
        } catch (NoSuchElementException e) {
            return Response.status(Response.Status.NOT_FOUND).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    private Response erroServidor(RuntimeException e) {
        return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(mensagem("Erro interno: " + e.getMessage()))
                .build();
    }

    private Mensagem mensagem(String detalhe) {
        return new Mensagem(detalhe);
    }

    public record Mensagem(String mensagem) {
    }
}
