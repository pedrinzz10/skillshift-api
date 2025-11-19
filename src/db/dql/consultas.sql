-- Consulta 1: TOP 10 usuarios com maior risco de automacao para priorizar planos.
SELECT u.id_usuario,
       u.nome,
       u.email,
       u.nivel_risco
  FROM t_skillshift_usuario u
 ORDER BY u.nivel_risco DESC
 FETCH FIRST 10 ROWS ONLY;

-- Consulta 2: Distribuicao de cursos ativos por categoria e carga horaria media.
SELECT c.categoria,
       COUNT(*) AS total_cursos,
       ROUND(AVG(NVL(c.duracao_horas,0)),2) AS duracao_media_horas
  FROM t_skillshift_curso c
 WHERE c.ativo = 'S'
 GROUP BY c.categoria
 ORDER BY total_cursos DESC;

-- Consulta 3: Desempenho das recomendacoes por cluster x status.
SELECT NVL(TO_CHAR(r.cluster_id),'SEM_CLUSTER') AS cluster,
       r.status,
       COUNT(*) AS qtde,
       ROUND(AVG(r.score),2) AS score_medio
  FROM t_skillshift_recomendacao r
 GROUP BY r.cluster_id, r.status
 ORDER BY cluster, r.status;

-- Consulta 4: Empresas com maior participacao de colaboradores e risco medio.
SELECT e.nome AS empresa,
       COUNT(ue.id_usuario) AS total_colaboradores,
       ROUND(AVG(u.nivel_risco),2) AS risco_medio
  FROM t_skillshift_empresa e
  LEFT JOIN t_skillshift_usuario_empresa ue ON ue.id_empresa = e.id_empresa
  LEFT JOIN t_skillshift_usuario u ON u.id_usuario = ue.id_usuario
 GROUP BY e.nome
 ORDER BY total_colaboradores DESC;

-- Consulta 5: Recomendacoes pendentes ha mais de 30 dias (necessitam follow-up).
SELECT r.id_recomendacao,
       r.id_usuario,
       u.nome,
       r.id_curso,
       c.nome AS curso,
       r.status,
       r.data_recomendacao
  FROM t_skillshift_recomendacao r
  JOIN t_skillshift_usuario u ON u.id_usuario = r.id_usuario
  JOIN t_skillshift_curso c ON c.id_curso = r.id_curso
 WHERE r.status = 'PENDENTE'
   AND r.data_recomendacao <= ADD_MONTHS(TRUNC(SYSDATE),-1)
 ORDER BY r.data_recomendacao;

-- Consulta 6: Comparativo de origem das recomendacoes (IA x EMPRESA x MANUAL).
SELECT r.fonte,
       COUNT(*) AS total,
       ROUND(AVG(r.score),2) AS score_medio,
       SUM(CASE WHEN r.status = 'CONCLUIDA' THEN 1 ELSE 0 END) AS concluidas
  FROM t_skillshift_recomendacao r
 GROUP BY r.fonte
 ORDER BY total DESC;

-- Consulta 7: Ultimo log de integracao com IA por usuario.
SELECT l.id_usuario,
       u.nome,
       MAX(l.criado_em) AS ultima_execucao,
       MAX(l.cluster_id) KEEP (DENSE_RANK LAST ORDER BY l.criado_em) AS ultimo_cluster,
       MAX(l.status) KEEP (DENSE_RANK LAST ORDER BY l.criado_em) AS status_execucao
  FROM t_skillshift_recomendacao_ia_log l
  JOIN t_skillshift_usuario u ON u.id_usuario = l.id_usuario
 GROUP BY l.id_usuario, u.nome
 ORDER BY ultima_execucao DESC;

-- Consulta 8: Cobertura de cursos recomendados versus catalogo total.
SELECT COUNT(DISTINCT r.id_curso) AS cursos_com_recomendacao,
       (SELECT COUNT(*) FROM t_skillshift_curso) AS cursos_catalogo,
       ROUND(COUNT(DISTINCT r.id_curso) / (SELECT COUNT(*) FROM t_skillshift_curso) * 100,2) AS cobertura_percentual
  FROM t_skillshift_recomendacao r;

-- Consulta 9: Aliases cadastrados x cursos oficiais (para auditar pareamento da IA).
SELECT c.nome AS curso_oficial,
       a.termo AS alias,
       c.categoria,
       c.nivel
  FROM t_skillshift_curso_alias a
  JOIN t_skillshift_curso c ON c.id_curso = a.id_curso
 ORDER BY c.nome;
