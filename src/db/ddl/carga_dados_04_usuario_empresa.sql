-- SCRIPT: SkillShift.AI - Banco de Dados (Oracle)
-- Autor: Equipe SkillShift
-- Disciplina: Building Relational Database - FIAP

-- DML
-- Vínculos usuário-empresa

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (1, 1, 'Analista Administrativo', TO_DATE('2019-05-10','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (2, 4, 'Operador Senior', TO_DATE('2016-02-01','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (3, 5, 'Consultora de Vendas', TO_DATE('2018-08-20','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (4, 4, 'Coordenador Logistico', TO_DATE('2020-01-15','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (5, 1, 'Desenvolvedor Full Stack', TO_DATE('2021-03-12','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (6, 3, 'Analista de RH', TO_DATE('2017-11-06','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (7, 5, 'Especialista em Marketing', TO_DATE('2019-07-18','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (8, 2, 'Enfermeiro Tecnico', TO_DATE('2015-09-01','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (9, 9, 'Gerente Industrial', TO_DATE('2014-04-22','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (10, 6, 'Controller Financeiro', TO_DATE('2013-12-02','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (3, 2, 'Consultora Comercial', TO_DATE('2021-06-01','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (5, 6, 'Scrum Master', TO_DATE('2022-10-11','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (7, 8, 'Consultora de Branding', TO_DATE('2021-04-19','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (11, 2, 'Coordenadora de Operacoes', TO_DATE('2018-02-14','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (12, 4, 'Supervisor de Docagem', TO_DATE('2017-03-01','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (13, 1, 'Engenheira de Dados Jr', TO_DATE('2022-07-07','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (14, 12, 'Head de Inovacao', TO_DATE('2020-05-18','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (15, 14, 'Especialista Financeiro', TO_DATE('2019-09-09','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (16, 11, 'Gerente de Parcerias', TO_DATE('2016-08-25','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (2, 11, 'Consultor de Melhoria Cont', TO_DATE('2022-01-12','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario_empresa (id_usuario, id_empresa, cargo, data_inicio)
VALUES (4, 11, 'Planejador de Frota', TO_DATE('2023-02-10','YYYY-MM-DD'));

COMMIT;
