package br.com.skillshift.config;

import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerResponseContext;
import jakarta.ws.rs.container.ContainerResponseFilter;
import jakarta.ws.rs.ext.Provider;

/**
 * Adiciona cabecalhos CORS permissivos para que frontends e bots chamem a API.
 */
@Provider
public class CorsFilter implements ContainerResponseFilter {

    @Override
    public void filter(ContainerRequestContext requestContext, ContainerResponseContext responseContext) {
        var headers = responseContext.getHeaders();
        headers.putSingle("Access-Control-Allow-Origin", "*");
        headers.putSingle("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS");
        headers.putSingle("Access-Control-Allow-Headers", "origin, content-type, accept, authorization");
        headers.putSingle("Access-Control-Max-Age", "86400");

        var requestHeaders = requestContext.getHeaderString("Access-Control-Request-Headers");
        if (requestHeaders != null && !requestHeaders.isBlank()) {
            headers.putSingle("Access-Control-Allow-Headers", requestHeaders);
        }
    }
}
