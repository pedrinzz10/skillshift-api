package br.com.skillshift.dao;

public interface RecomendacaoLogDAO {

    void registrar(Long usuarioId, Integer cluster, String payloadEnvio, String payloadRetorno, String status, String erro);
}
