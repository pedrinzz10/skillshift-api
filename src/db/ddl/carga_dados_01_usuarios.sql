-- SCRIPT: SkillShift.AI - Banco de Dados (Oracle)
-- Autor: Equipe SkillShift
-- Disciplina: Building Relational Database - FIAP

-- DML
-- Usuários

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (1, 'Ana Souza', 'ana.souza@skillshift.ai', 'HASH_A1', 34, 'Graduacao', 'Administracao', 72.5, 'USER', TO_DATE('2024-01-10','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (2, 'Bruno Lima', 'bruno.lima@skillshift.ai', 'HASH_B2', 29, 'Ensino Medio', 'Operador de Maquinas', 88.3, 'USER', TO_DATE('2024-02-05','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (3, 'Carla Menezes', 'carla.menezes@skillshift.ai', 'HASH_C3', 31, 'Tecnologo', 'Vendas', 65.0, 'USER', TO_DATE('2024-01-28','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (4, 'Diego Pereira', 'diego.pereira@skillshift.ai', 'HASH_D4', 36, 'Graduacao', 'Logistica', 58.1, 'USER', TO_DATE('2023-12-19','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (5, 'Elisa Martins', 'elisa.martins@skillshift.ai', 'HASH_E5', 27, 'Graduacao', 'TI', 35.4, 'USER', TO_DATE('2024-03-03','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (6, 'Fernando Costa', 'fernando.costa@skillshift.ai', 'HASH_F6', 38, 'Graduacao', 'Recursos Humanos', 45.2, 'USER', TO_DATE('2023-11-11','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (7, 'Gabriela Nunes', 'gabriela.nunes@skillshift.ai', 'HASH_G7', 33, 'MBA', 'Marketing Digital', 60.9, 'USER', TO_DATE('2024-02-18','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (8, 'Henrique Rocha', 'henrique.rocha@skillshift.ai', 'HASH_H8', 40, 'Graduacao', 'Saude', 29.6, 'USER', TO_DATE('2023-10-25','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (9, 'Isabela Torres', 'isabela.torres@skillshift.ai', 'HASH_I9', 41, 'Graduacao', 'Operacoes Industriais', 90.1, 'ADMIN', TO_DATE('2023-09-14','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (10, 'Joao Almeida', 'joao.almeida@skillshift.ai', 'HASH_J10', 46, 'Especializacao', 'Financeiro', 54.8, 'EMPRESA', TO_DATE('2023-08-30','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (11, 'Karen Prado', 'karen.prado@skillshift.ai', 'HASH_K11', 32, 'Graduacao', 'Operacoes Financeiras', 48.7, 'USER', TO_DATE('2024-04-01','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (12, 'Lucas Araujo', 'lucas.araujo@skillshift.ai', 'HASH_L12', 28, 'Ensino Medio', 'Operador Logistico', 82.9, 'USER', TO_DATE('2024-03-22','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (13, 'Marcela Ribeiro', 'marcela.ribeiro@skillshift.ai', 'HASH_M13', 30, 'Tecnologo', 'TI', 27.4, 'USER', TO_DATE('2024-05-15','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (14, 'Nelson Faria', 'nelson.faria@skillshift.ai', 'HASH_N14', 37, 'Mestrado', 'Pesquisa e Desenvolvimento', 41.8, 'ADMIN', TO_DATE('2024-02-08','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (15, 'Olivia Santana', 'olivia.santana@skillshift.ai', 'HASH_O15', 35, 'Graduacao', 'Servicos Financeiros', 67.9, 'USER', TO_DATE('2024-04-18','YYYY-MM-DD'));

INSERT INTO t_skillshift_usuario (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (16, 'Renata Sales', 'renata.sales@skillshift.ai', 'HASH_R16', 42, 'Graduacao', 'Parcerias Corporativas', 52.1, 'EMPRESA', TO_DATE('2023-07-11','YYYY-MM-DD'));

COMMIT;
