package br.com.skillshift.resource;

import java.util.NoSuchElementException;

import br.com.skillshift.bo.RecomendacaoBO;
import br.com.skillshift.exception.IAServiceIndisponivelException;
import br.com.skillshift.model.Recomendacao;
import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/recomendacoes")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class RecomendacaoResource {

    @Inject
    RecomendacaoBO recomendacaoBO;

    @GET
    public Response listar(@QueryParam("usuarioId") Long usuarioId) {
        try {
            return Response.ok(recomendacaoBO.listar(usuarioId)).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @POST
    public Response criar(Recomendacao recomendacao) {
        try {
            Recomendacao criada = recomendacaoBO.criar(recomendacao);
            return Response.status(Response.Status.CREATED).entity(criada).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST).entity(mensagem(e.getMessage())).build();
        } catch (NoSuchElementException e) {
            return Response.status(Response.Status.NOT_FOUND).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @PUT
    @Path("/{id}")
    public Response atualizar(@PathParam("id") Long id, Recomendacao recomendacao) {
        try {
            return Response.ok(recomendacaoBO.atualizar(id, recomendacao)).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST).entity(mensagem(e.getMessage())).build();
        } catch (NoSuchElementException e) {
            return Response.status(Response.Status.NOT_FOUND).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @DELETE
    @Path("/{id}")
    public Response deletar(@PathParam("id") Long id) {
        try {
            recomendacaoBO.deletar(id);
            return Response.noContent().build();
        } catch (NoSuchElementException e) {
            return Response.status(Response.Status.NOT_FOUND).entity(mensagem(e.getMessage())).build();
        } catch (RuntimeException e) {
            return erroServidor(e);
        }
    }

    @POST
    @Path("/gerar")
    public Response gerar(@QueryParam("usuarioId") Long usuarioId) {
        if (usuarioId == null) {
            return Response.status(Response.Status.BAD_REQUEST).entity(mensagem("usuarioId é obrigatório")).build();
        }
        try {
            return Response.status(Response.Status.CREATED).entity(recomendacaoBO.gerarRecomendacoes(usuarioId)).build();
        } catch (NoSuchElementException e) {
            return Response.status(Response.Status.NOT_FOUND).entity(mensagem(e.getMessage())).build();
        } catch (IAServiceIndisponivelException e) {
            return Response.status(Response.Status.SERVICE_UNAVAILABLE)
                    .entity(erro("Servico de inteligencia artificial indisponivel no momento. Tente novamente mais tarde."))
                    .build();
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

    private Erro erro(String detalhe) {
        return new Erro(detalhe);
    }

    public record Mensagem(String mensagem) {
    }

    public record Erro(String erro) {
    }
}
