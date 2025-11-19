-- SCRIPT: SkillShift.AI - Banco de Dados (Oracle)
-- Autor: Equipe SkillShift
-- Disciplina: Building Relational Database - FIAP

-- DML
-- Recomendações

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (1, 1, 7, 78.5, 'IA', 'PENDENTE', TO_DATE('2024-05-01','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (2, 2, 9, 88.2, 'IA', 'EM_ANDAMENTO', TO_DATE('2024-04-20','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (3, 3, 4, 74.1, 'MANUAL', 'CONCLUIDA', TO_DATE('2024-03-15','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (4, 4, 6, 69.5, 'EMPRESA', 'EM_ANDAMENTO', TO_DATE('2024-04-05','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (5, 5, 3, 92.3, 'IA', 'PENDENTE', TO_DATE('2024-05-12','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (6, 6, 5, 65.0, 'EMPRESA', 'PENDENTE', TO_DATE('2024-02-27','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (7, 7, 2, 81.4, 'IA', 'CONCLUIDA', TO_DATE('2024-01-30','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (8, 8, 1, 63.3, 'MANUAL', 'PENDENTE', TO_DATE('2024-03-02','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (9, 9, 8, 94.6, 'IA', 'EM_ANDAMENTO', TO_DATE('2024-05-08','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (10, 10, 10, 71.8, 'EMPRESA', 'PENDENTE', TO_DATE('2024-04-12','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (11, 11, 6, 84.2, 'MANUAL', 'EM_ANDAMENTO', TO_DATE('2024-05-20','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (12, 12, 9, 79.3, 'IA', 'PENDENTE', TO_DATE('2024-05-18','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (13, 13, 11, 68.7, 'EMPRESA', 'PENDENTE', TO_DATE('2024-04-28','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (14, 14, 8, 90.5, 'IA', 'EM_ANDAMENTO', TO_DATE('2024-05-22','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (15, 15, 14, 73.9, 'MANUAL', 'CONCLUIDA', TO_DATE('2024-03-19','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (16, 1, 12, 86.0, 'EMPRESA', 'PENDENTE', TO_DATE('2024-05-24','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (17, 5, 15, 66.4, 'IA', 'PENDENTE', TO_DATE('2024-05-21','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (18, 7, 13, 77.2, 'EMPRESA', 'EM_ANDAMENTO', TO_DATE('2024-04-30','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (19, 9, 16, 88.8, 'IA', 'PENDENTE', TO_DATE('2024-05-25','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (20, 16, 10, 71.0, 'EMPRESA', 'EM_ANDAMENTO', TO_DATE('2024-04-07','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (21, 4, 9, 64.9, 'MANUAL', 'PENDENTE', TO_DATE('2024-02-25','YYYY-MM-DD'));

INSERT INTO t_skillshift_recomendacao (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (22, 12, 2, 85.6, 'IA', 'CONCLUIDA', TO_DATE('2024-03-05','YYYY-MM-DD'));

COMMIT;
