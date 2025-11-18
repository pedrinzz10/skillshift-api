package br.com.skillshift.resource;

import java.util.NoSuchElementException;

import br.com.skillshift.bo.EmpresaBO;
import br.com.skillshift.model.Empresa;
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

@Path("/empresas")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class EmpresaResource {

    @Inject
    EmpresaBO empresaBO;

    @GET
    public Response listar() {
        try {
            return Response.ok(empresaBO.listar()).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @GET
    @Path("/{id}")
    public Response buscarPorId(@PathParam("id") Long id) {
        try {
            return Response.ok(empresaBO.buscarPorId(id)).build();
        } catch (NoSuchElementException e) {
            return Response.status(Response.Status.NOT_FOUND).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @POST
    public Response criar(Empresa empresa) {
        try {
            Empresa criada = empresaBO.criar(empresa);
            return Response.status(Response.Status.CREATED).entity(criada).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @PUT
    @Path("/{id}")
    public Response atualizar(@PathParam("id") Long id, Empresa empresa) {
        try {
            return Response.ok(empresaBO.atualizar(id, empresa)).build();
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
            empresaBO.deletar(id);
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
