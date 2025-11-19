package br.com.skillshift.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * DTO enviado para o endpoint /cluster-profile.
 */
public class IAEntradaPerfil {

    @JsonProperty("OP_score")
    private Double opScore;

    @JsonProperty("CO_score")
    private Double coScore;

    @JsonProperty("EX_score")
    private Double exScore;

    @JsonProperty("AG_score")
    private Double agScore;

    @JsonProperty("NE_score")
    private Double neScore;

    @JsonProperty("Raciocinio_score")
    private Double raciocinioScore;

    @JsonProperty("Problemas_score")
    private Double problemasScore;

    @JsonProperty("Colab_score")
    private Double colabScore;

    @JsonProperty("Adapt_score")
    private Double adaptScore;

    @JsonProperty("Educ_score")
    private Double educScore;

    public Double getOpScore() {
        return opScore;
    }

    public void setOpScore(Double opScore) {
        this.opScore = opScore;
    }

    public Double getCoScore() {
        return coScore;
    }

    public void setCoScore(Double coScore) {
        this.coScore = coScore;
    }

    public Double getExScore() {
        return exScore;
    }

    public void setExScore(Double exScore) {
        this.exScore = exScore;
    }

    public Double getAgScore() {
        return agScore;
    }

    public void setAgScore(Double agScore) {
        this.agScore = agScore;
    }

    public Double getNeScore() {
        return neScore;
    }

    public void setNeScore(Double neScore) {
        this.neScore = neScore;
    }

    public Double getRaciocinioScore() {
        return raciocinioScore;
    }

    public void setRaciocinioScore(Double raciocinioScore) {
        this.raciocinioScore = raciocinioScore;
    }

    public Double getProblemasScore() {
        return problemasScore;
    }

    public void setProblemasScore(Double problemasScore) {
        this.problemasScore = problemasScore;
    }

    public Double getColabScore() {
        return colabScore;
    }

    public void setColabScore(Double colabScore) {
        this.colabScore = colabScore;
    }

    public Double getAdaptScore() {
        return adaptScore;
    }

    public void setAdaptScore(Double adaptScore) {
        this.adaptScore = adaptScore;
    }

    public Double getEducScore() {
        return educScore;
    }

    public void setEducScore(Double educScore) {
        this.educScore = educScore;
    }
}
