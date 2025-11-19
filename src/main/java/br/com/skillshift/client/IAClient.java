package br.com.skillshift.client;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import br.com.skillshift.dto.IAEntradaPerfil;
import br.com.skillshift.dto.IARetornoCluster;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@ApplicationScoped
@RegisterRestClient(configKey = "skillshift-ia")
@Path("/cluster-profile")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public interface IAClient {

    @POST
    IARetornoCluster gerarPerfil(IAEntradaPerfil entrada);
}
