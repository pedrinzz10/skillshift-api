package br.com.skillshift.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * DTO de resposta do endpoint /cluster-profile.
 */
public class IARetornoCluster {

    @JsonProperty("cluster")
    private Integer cluster;

    @JsonProperty("cursos_recomendados")
    private List<String> cursosRecomendados;

    public Integer getCluster() {
        return cluster;
    }

    public void setCluster(Integer cluster) {
        this.cluster = cluster;
    }

    public List<String> getCursosRecomendados() {
        return cursosRecomendados;
    }

    public void setCursosRecomendados(List<String> cursosRecomendados) {
        this.cursosRecomendados = cursosRecomendados;
    }
}
