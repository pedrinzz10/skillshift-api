package br.com.skillshift.resource;

import java.util.NoSuchElementException;

import br.com.skillshift.bo.CursoBO;
import br.com.skillshift.model.Curso;
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

@Path("/cursos")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CursoResource {

    @Inject
    CursoBO cursoBO;

    @GET
    public Response listar() {
        try {
            return Response.ok(cursoBO.listar()).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @GET
    @Path("/{id}")
    public Response buscarPorId(@PathParam("id") Long id) {
        try {
            return Response.ok(cursoBO.buscarPorId(id)).build();
        } catch (NoSuchElementException e) {
            return Response.status(Response.Status.NOT_FOUND).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @POST
    public Response criar(Curso curso) {
        try {
            Curso criado = cursoBO.criar(curso);
            return Response.status(Response.Status.CREATED).entity(criado).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @PUT
    @Path("/{id}")
    public Response atualizar(@PathParam("id") Long id, Curso curso) {
        try {
            return Response.ok(cursoBO.atualizar(id, curso)).build();
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
            cursoBO.deletar(id);
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
