-- Consulta 1: Identifica os 5 usuarios com maior risco para priorizar planos de requalificacao.
SELECT u.nome,
       u.email,
       u.nivel_risco
  FROM t_skillshift_usuario u
 ORDER BY u.nivel_risco DESC
 FETCH FIRST 5 ROWS ONLY;

-- Consulta 2: Mede quais cursos estao ativos por categoria para orientar novas parcerias.
SELECT c.categoria,
       COUNT(*) AS total_cursos
  FROM t_skillshift_curso c
 WHERE c.ativo = 'S'
 GROUP BY c.categoria
 ORDER BY total_cursos DESC;

-- Consulta 3: Avalia o desempenho das recomendacoes IA por cluster e status.
SELECT r.cluster,
       r.status,
       COUNT(*) AS qtde
  FROM t_skillshift_recomendacao r
 GROUP BY r.cluster, r.status
 ORDER BY r.cluster;

-- Consulta 4: Detecta empresas com maior participacao de usuarios para direcionar ofertas B2B.
SELECT e.nome AS empresa,
       COUNT(ue.id_usuario) AS total_colaboradores
  FROM t_skillshift_empresa e
  LEFT JOIN t_skillshift_usuario_empresa ue ON ue.id_empresa = e.id_empresa
 GROUP BY e.nome
 ORDER BY total_colaboradores DESC;
