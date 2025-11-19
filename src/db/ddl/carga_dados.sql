-- SCRIPT: SkillShift.AI - Banco de Dados (Oracle)
-- Autor: Equipe SkillShift
-- Disciplina: Building Relational Database - FIAP

-- DML
-- Usuários
INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (1, 'Ana Souza', 'ana.souza@skillshift.ai', 'HASH_A1', 34, 'Graduacao', 'Administracao', 72.5, 'USER', TO_DATE('2024-01-10','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (2, 'Bruno Lima', 'bruno.lima@skillshift.ai', 'HASH_B2', 29, 'Ensino Medio', 'Operador de Maquinas', 88.3, 'USER', TO_DATE('2024-02-05','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (3, 'Carla Menezes', 'carla.menezes@skillshift.ai', 'HASH_C3', 31, 'Tecnologo', 'Vendas', 65.0, 'USER', TO_DATE('2024-01-28','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (4, 'Diego Pereira', 'diego.pereira@skillshift.ai', 'HASH_D4', 36, 'Graduacao', 'Logistica', 58.1, 'USER', TO_DATE('2023-12-19','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (5, 'Elisa Martins', 'elisa.martins@skillshift.ai', 'HASH_E5', 27, 'Graduacao', 'TI', 35.4, 'USER', TO_DATE('2024-03-03','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (6, 'Fernando Costa', 'fernando.costa@skillshift.ai', 'HASH_F6', 38, 'Graduacao', 'Recursos Humanos', 45.2, 'USER', TO_DATE('2023-11-11','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (7, 'Gabriela Nunes', 'gabriela.nunes@skillshift.ai', 'HASH_G7', 33, 'MBA', 'Marketing Digital', 60.9, 'USER', TO_DATE('2024-02-18','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (8, 'Henrique Rocha', 'henrique.rocha@skillshift.ai', 'HASH_H8', 40, 'Graduacao', 'Saude', 29.6, 'USER', TO_DATE('2023-10-25','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (9, 'Isabela Torres', 'isabela.torres@skillshift.ai', 'HASH_I9', 41, 'Graduacao', 'Operacoes Industriais', 90.1, 'ADMIN', TO_DATE('2023-09-14','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (10, 'Joao Almeida', 'joao.almeida@skillshift.ai', 'HASH_J10', 46, 'Especializacao', 'Financeiro', 54.8, 'EMPRESA', TO_DATE('2023-08-30','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (11, 'Karen Prado', 'karen.prado@skillshift.ai', 'HASH_K11', 32, 'Graduacao', 'Operacoes Financeiras', 48.7, 'USER', TO_DATE('2024-04-01','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (12, 'Lucas Araujo', 'lucas.araujo@skillshift.ai', 'HASH_L12', 28, 'Ensino Medio', 'Operador Logistico', 82.9, 'USER', TO_DATE('2024-03-22','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (13, 'Marcela Ribeiro', 'marcela.ribeiro@skillshift.ai', 'HASH_M13', 30, 'Tecnologo', 'TI', 27.4, 'USER', TO_DATE('2024-05-15','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (14, 'Nelson Faria', 'nelson.faria@skillshift.ai', 'HASH_N14', 37, 'Mestrado', 'Pesquisa e Desenvolvimento', 41.8, 'ADMIN', TO_DATE('2024-02-08','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (15, 'Olivia Santana', 'olivia.santana@skillshift.ai', 'HASH_O15', 35, 'Graduacao', 'Servicos Financeiros', 67.9, 'USER', TO_DATE('2024-04-18','YYYY-MM-DD'));

INSERT INTO TB_USUARIO (id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, nivel_risco, tipo_perfil, criado_em)
VALUES (16, 'Renata Sales', 'renata.sales@skillshift.ai', 'HASH_R16', 42, 'Graduacao', 'Parcerias Corporativas', 52.1, 'EMPRESA', TO_DATE('2023-07-11','YYYY-MM-DD'));

-- Cursos
INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (1, 'Fundamentos de Ciencia de Dados', 'Dados', 40, 'Alura', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (2, 'Programacao em Python para Automacao', 'Programacao', 50, 'Coursera', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (3, 'Inteligencia Artificial Aplicada', 'IA', 60, 'FIAP On', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (4, 'Business Intelligence com Power BI', 'BI', 35, 'Udemy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (5, 'Soft Skills para Lideranca', 'Comportamental', 20, 'Interno', 'INICIAL', 'N');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (6, 'Gestao de Projetos Agile', 'Gestao', 45, 'Alura', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (7, 'Analise de Dados com SQL', 'Dados', 30, 'Coursera', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (8, 'Machine Learning para Negocios', 'IA', 55, 'FIAP On', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (9, 'Logistica 4.0 e IoT', 'Logistica', 25, 'Udemy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (10, 'Ciberseguranca Essencial', 'TI', 40, 'Alura', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (11, 'Design de Experiencia do Usuario', 'Design', 32, 'Udemy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (12, 'Automacao de Processos com RPA', 'Automacao', 36, 'Coursera', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (13, 'Lideranca Inclusiva', 'Comportamental', 24, 'Interno', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (14, 'Storytelling com Dados', 'BI', 28, 'FIAP On', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (15, 'Fundamentos de Cloud Computing', 'TI', 42, 'Alura', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (16, 'Seguranca em Operacoes Industriais', 'Industria', 30, 'Udemy', 'INICIAL', 'S');

-- Empresas

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (17, 'Atendimento Inteligente com IA - Google', 'Servicos de Atendimento', 42, 'Google Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (18, 'Automacao Industrial Avancada - Google', 'Automacao Industrial', 68, 'Google Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (19, 'Analise Preditiva para Logistica - Google', 'Logistica e Transporte', 56, 'Google Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (20, 'Robos de Processo para Backoffice - Google', 'Operacoes Administrativas', 48, 'Google Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (21, 'Visao Computacional para Qualidade - Google', 'Controle de Qualidade', 54, 'Google Academy', 'AVANCADO', 'S');

-- Aliases para facilitar o pareamento com a IA
INSERT INTO TB_CURSO_ALIAS (id_alias, id_curso, termo) VALUES (1, 17, 'Atendimento IA Google');
INSERT INTO TB_CURSO_ALIAS (id_alias, id_curso, termo) VALUES (2, 22, 'Atendimento IA IBM');
INSERT INTO TB_CURSO_ALIAS (id_alias, id_curso, termo) VALUES (3, 27, 'Automacao Industrial Microsoft');
INSERT INTO TB_CURSO_ALIAS (id_alias, id_curso, termo) VALUES (4, 32, 'Logistica Preditiva Amazon');
INSERT INTO TB_CURSO_ALIAS (id_alias, id_curso, termo) VALUES (5, 37, 'RPA Backoffice Siemens');
INSERT INTO TB_CURSO_ALIAS (id_alias, id_curso, termo) VALUES (6, 42, 'Visao Computacional Siemens');
INSERT INTO TB_CURSO_ALIAS (id_alias, id_curso, termo) VALUES (7, 47, 'Atendimento IA Accenture');
INSERT INTO TB_CURSO_ALIAS (id_alias, id_curso, termo) VALUES (8, 52, 'Logistica IA Deloitte');
INSERT INTO TB_CURSO_ALIAS (id_alias, id_curso, termo) VALUES (9, 57, 'RPA Operacional PwC');
INSERT INTO TB_CURSO_ALIAS (id_alias, id_curso, termo) VALUES (10, 62, 'Qualidade Visao Computacional EY');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (22, 'Atendimento Inteligente com IA - IBM', 'Servicos de Atendimento', 44, 'IBM Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (23, 'Automacao Industrial Avancada - IBM', 'Automacao Industrial', 70, 'IBM Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (24, 'Analise Preditiva para Logistica - IBM', 'Logistica e Transporte', 58, 'IBM Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (25, 'Robos de Processo para Backoffice - IBM', 'Operacoes Administrativas', 50, 'IBM Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (26, 'Visao Computacional para Qualidade - IBM', 'Controle de Qualidade', 56, 'IBM Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (27, 'Atendimento Inteligente com IA - Microsoft', 'Servicos de Atendimento', 46, 'Microsoft Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (28, 'Automacao Industrial Avancada - Microsoft', 'Automacao Industrial', 72, 'Microsoft Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (29, 'Analise Preditiva para Logistica - Microsoft', 'Logistica e Transporte', 60, 'Microsoft Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (30, 'Robos de Processo para Backoffice - Microsoft', 'Operacoes Administrativas', 52, 'Microsoft Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (31, 'Visao Computacional para Qualidade - Microsoft', 'Controle de Qualidade', 58, 'Microsoft Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (32, 'Atendimento Inteligente com IA - Amazon', 'Servicos de Atendimento', 48, 'Amazon Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (33, 'Automacao Industrial Avancada - Amazon', 'Automacao Industrial', 74, 'Amazon Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (34, 'Analise Preditiva para Logistica - Amazon', 'Logistica e Transporte', 62, 'Amazon Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (35, 'Robos de Processo para Backoffice - Amazon', 'Operacoes Administrativas', 54, 'Amazon Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (36, 'Visao Computacional para Qualidade - Amazon', 'Controle de Qualidade', 60, 'Amazon Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (37, 'Atendimento Inteligente com IA - Siemens', 'Servicos de Atendimento', 50, 'Siemens Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (38, 'Automacao Industrial Avancada - Siemens', 'Automacao Industrial', 76, 'Siemens Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (39, 'Analise Preditiva para Logistica - Siemens', 'Logistica e Transporte', 64, 'Siemens Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (40, 'Robos de Processo para Backoffice - Siemens', 'Operacoes Administrativas', 56, 'Siemens Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (41, 'Visao Computacional para Qualidade - Siemens', 'Controle de Qualidade', 62, 'Siemens Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (42, 'Atendimento Inteligente com IA - Accenture', 'Servicos de Atendimento', 42, 'Accenture Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (43, 'Automacao Industrial Avancada - Accenture', 'Automacao Industrial', 68, 'Accenture Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (44, 'Analise Preditiva para Logistica - Accenture', 'Logistica e Transporte', 56, 'Accenture Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (45, 'Robos de Processo para Backoffice - Accenture', 'Operacoes Administrativas', 48, 'Accenture Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (46, 'Visao Computacional para Qualidade - Accenture', 'Controle de Qualidade', 54, 'Accenture Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (47, 'Atendimento Inteligente com IA - Deloitte', 'Servicos de Atendimento', 44, 'Deloitte Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (48, 'Automacao Industrial Avancada - Deloitte', 'Automacao Industrial', 70, 'Deloitte Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (49, 'Analise Preditiva para Logistica - Deloitte', 'Logistica e Transporte', 58, 'Deloitte Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (50, 'Robos de Processo para Backoffice - Deloitte', 'Operacoes Administrativas', 50, 'Deloitte Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (51, 'Visao Computacional para Qualidade - Deloitte', 'Controle de Qualidade', 56, 'Deloitte Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (52, 'Atendimento Inteligente com IA - PwC', 'Servicos de Atendimento', 46, 'PwC Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (53, 'Automacao Industrial Avancada - PwC', 'Automacao Industrial', 72, 'PwC Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (54, 'Analise Preditiva para Logistica - PwC', 'Logistica e Transporte', 60, 'PwC Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (55, 'Robos de Processo para Backoffice - PwC', 'Operacoes Administrativas', 52, 'PwC Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (56, 'Visao Computacional para Qualidade - PwC', 'Controle de Qualidade', 58, 'PwC Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (57, 'Atendimento Inteligente com IA - EY', 'Servicos de Atendimento', 48, 'EY Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (58, 'Automacao Industrial Avancada - EY', 'Automacao Industrial', 74, 'EY Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (59, 'Analise Preditiva para Logistica - EY', 'Logistica e Transporte', 62, 'EY Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (60, 'Robos de Processo para Backoffice - EY', 'Operacoes Administrativas', 54, 'EY Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (61, 'Visao Computacional para Qualidade - EY', 'Controle de Qualidade', 60, 'EY Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (62, 'Atendimento Inteligente com IA - KPMG', 'Servicos de Atendimento', 50, 'KPMG Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (63, 'Automacao Industrial Avancada - KPMG', 'Automacao Industrial', 76, 'KPMG Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (64, 'Analise Preditiva para Logistica - KPMG', 'Logistica e Transporte', 64, 'KPMG Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (65, 'Robos de Processo para Backoffice - KPMG', 'Operacoes Administrativas', 56, 'KPMG Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (66, 'Visao Computacional para Qualidade - KPMG', 'Controle de Qualidade', 62, 'KPMG Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (67, 'Atendimento Inteligente com IA - Salesforce', 'Servicos de Atendimento', 42, 'Salesforce Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (68, 'Automacao Industrial Avancada - Salesforce', 'Automacao Industrial', 68, 'Salesforce Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (69, 'Analise Preditiva para Logistica - Salesforce', 'Logistica e Transporte', 56, 'Salesforce Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (70, 'Robos de Processo para Backoffice - Salesforce', 'Operacoes Administrativas', 48, 'Salesforce Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (71, 'Visao Computacional para Qualidade - Salesforce', 'Controle de Qualidade', 54, 'Salesforce Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (72, 'Atendimento Inteligente com IA - Oracle', 'Servicos de Atendimento', 44, 'Oracle Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (73, 'Automacao Industrial Avancada - Oracle', 'Automacao Industrial', 70, 'Oracle Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (74, 'Analise Preditiva para Logistica - Oracle', 'Logistica e Transporte', 58, 'Oracle Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (75, 'Robos de Processo para Backoffice - Oracle', 'Operacoes Administrativas', 50, 'Oracle Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (76, 'Visao Computacional para Qualidade - Oracle', 'Controle de Qualidade', 56, 'Oracle Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (77, 'Atendimento Inteligente com IA - SAP', 'Servicos de Atendimento', 46, 'SAP Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (78, 'Automacao Industrial Avancada - SAP', 'Automacao Industrial', 72, 'SAP Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (79, 'Analise Preditiva para Logistica - SAP', 'Logistica e Transporte', 60, 'SAP Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (80, 'Robos de Processo para Backoffice - SAP', 'Operacoes Administrativas', 52, 'SAP Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (81, 'Visao Computacional para Qualidade - SAP', 'Controle de Qualidade', 58, 'SAP Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (82, 'Atendimento Inteligente com IA - Cisco', 'Servicos de Atendimento', 48, 'Cisco Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (83, 'Automacao Industrial Avancada - Cisco', 'Automacao Industrial', 74, 'Cisco Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (84, 'Analise Preditiva para Logistica - Cisco', 'Logistica e Transporte', 62, 'Cisco Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (85, 'Robos de Processo para Backoffice - Cisco', 'Operacoes Administrativas', 54, 'Cisco Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (86, 'Visao Computacional para Qualidade - Cisco', 'Controle de Qualidade', 60, 'Cisco Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (87, 'Atendimento Inteligente com IA - Intel', 'Servicos de Atendimento', 50, 'Intel Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (88, 'Automacao Industrial Avancada - Intel', 'Automacao Industrial', 76, 'Intel Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (89, 'Analise Preditiva para Logistica - Intel', 'Logistica e Transporte', 64, 'Intel Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (90, 'Robos de Processo para Backoffice - Intel', 'Operacoes Administrativas', 56, 'Intel Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (91, 'Visao Computacional para Qualidade - Intel', 'Controle de Qualidade', 62, 'Intel Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (92, 'Atendimento Inteligente com IA - NVIDIA', 'Servicos de Atendimento', 42, 'NVIDIA Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (93, 'Automacao Industrial Avancada - NVIDIA', 'Automacao Industrial', 68, 'NVIDIA Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (94, 'Analise Preditiva para Logistica - NVIDIA', 'Logistica e Transporte', 56, 'NVIDIA Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (95, 'Robos de Processo para Backoffice - NVIDIA', 'Operacoes Administrativas', 48, 'NVIDIA Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (96, 'Visao Computacional para Qualidade - NVIDIA', 'Controle de Qualidade', 54, 'NVIDIA Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (97, 'Atendimento Inteligente com IA - Meta', 'Servicos de Atendimento', 44, 'Meta Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (98, 'Automacao Industrial Avancada - Meta', 'Automacao Industrial', 70, 'Meta Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (99, 'Analise Preditiva para Logistica - Meta', 'Logistica e Transporte', 58, 'Meta Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (100, 'Robos de Processo para Backoffice - Meta', 'Operacoes Administrativas', 50, 'Meta Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (101, 'Visao Computacional para Qualidade - Meta', 'Controle de Qualidade', 56, 'Meta Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (102, 'Atendimento Inteligente com IA - Uber', 'Servicos de Atendimento', 46, 'Uber Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (103, 'Automacao Industrial Avancada - Uber', 'Automacao Industrial', 72, 'Uber Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (104, 'Analise Preditiva para Logistica - Uber', 'Logistica e Transporte', 60, 'Uber Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (105, 'Robos de Processo para Backoffice - Uber', 'Operacoes Administrativas', 52, 'Uber Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (106, 'Visao Computacional para Qualidade - Uber', 'Controle de Qualidade', 58, 'Uber Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (107, 'Atendimento Inteligente com IA - Spotify', 'Servicos de Atendimento', 48, 'Spotify Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (108, 'Automacao Industrial Avancada - Spotify', 'Automacao Industrial', 74, 'Spotify Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (109, 'Analise Preditiva para Logistica - Spotify', 'Logistica e Transporte', 62, 'Spotify Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (110, 'Robos de Processo para Backoffice - Spotify', 'Operacoes Administrativas', 54, 'Spotify Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (111, 'Visao Computacional para Qualidade - Spotify', 'Controle de Qualidade', 60, 'Spotify Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (112, 'Atendimento Inteligente com IA - Tesla', 'Servicos de Atendimento', 50, 'Tesla Academy', 'INICIAL', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (113, 'Automacao Industrial Avancada - Tesla', 'Automacao Industrial', 76, 'Tesla Academy', 'AVANCADO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (114, 'Analise Preditiva para Logistica - Tesla', 'Logistica e Transporte', 64, 'Tesla Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (115, 'Robos de Processo para Backoffice - Tesla', 'Operacoes Administrativas', 56, 'Tesla Academy', 'INTERMEDIARIO', 'S');

INSERT INTO TB_CURSO (id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo)
VALUES (116, 'Visao Computacional para Qualidade - Tesla', 'Controle de Qualidade', 62, 'Tesla Academy', 'AVANCADO', 'S');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (1, 'NeuroData Tech', 'Tecnologia', 'MEDIA', '11.111.111/0001-11');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (2, 'HealthBridge', 'Saude', 'GRANDE', '22.222.222/0001-22');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (3, 'EduLearn Group', 'Educacao', 'MEDIA', '33.333.333/0001-33');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (4, 'MaxLog Transportes', 'Logistica', 'GRANDE', '44.444.444/0001-44');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (5, 'VarejoMix', 'Varejo', 'MEDIA', '55.555.555/0001-55');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (6, 'Futuro Finance', 'Financeiro', 'GRANDE', '66.666.666/0001-66');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (7, 'AgroPlus', 'Agronegocio', 'PEQUENA', '77.777.777/0001-77');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (8, 'Innova Retail Labs', 'Varejo', 'PEQUENA', '88.888.888/0001-88');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (9, 'SkyNetics Robotics', 'Tecnologia', 'PEQUENA', '99.999.999/0001-99');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (10, 'PulseCare', 'Saude', 'MEDIA', '10.101.010/0001-10');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (11, 'GreenFuture Logistics', 'Logistica', 'MEDIA', '12.121.212/0001-12');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (12, 'QuantAI Labs', 'Tecnologia', 'PEQUENA', '13.131.313/0001-13');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (13, 'PulseFit Wellness', 'Saude', 'PEQUENA', '14.141.414/0001-14');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (14, 'SmartBank Digital', 'Financeiro', 'GRANDE', '15.151.515/0001-15');

INSERT INTO TB_EMPRESA (id_empresa, nome, setor, tamanho, cnpj)
VALUES (15, 'EduNext Digital', 'Educacao', 'MEDIA', '16.161.616/0001-16');

-- Vínculos usuário-empresa
INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (1, 1, 'Analista Administrativo', TO_DATE('2019-05-10','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (2, 4, 'Operador Senior', TO_DATE('2016-02-01','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (3, 5, 'Consultora de Vendas', TO_DATE('2018-08-20','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (4, 4, 'Coordenador Logistico', TO_DATE('2020-01-15','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (5, 1, 'Desenvolvedor Full Stack', TO_DATE('2021-03-12','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (6, 3, 'Analista de RH', TO_DATE('2017-11-06','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (7, 5, 'Especialista em Marketing', TO_DATE('2019-07-18','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (8, 2, 'Enfermeiro Tecnico', TO_DATE('2015-09-01','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (9, 9, 'Gerente Industrial', TO_DATE('2014-04-22','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (10, 6, 'Controller Financeiro', TO_DATE('2013-12-02','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (3, 2, 'Consultora Comercial', TO_DATE('2021-06-01','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (5, 6, 'Scrum Master', TO_DATE('2022-10-11','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (7, 8, 'Consultora de Branding', TO_DATE('2021-04-19','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (11, 2, 'Coordenadora de Operacoes', TO_DATE('2018-02-14','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (12, 4, 'Supervisor de Docagem', TO_DATE('2017-03-01','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (13, 1, 'Engenheira de Dados Jr', TO_DATE('2022-07-07','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (14, 12, 'Head de Inovacao', TO_DATE('2020-05-18','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (15, 14, 'Especialista Financeiro', TO_DATE('2019-09-09','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (16, 11, 'Gerente de Parcerias', TO_DATE('2016-08-25','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (2, 11, 'Consultor de Melhoria Cont', TO_DATE('2022-01-12','YYYY-MM-DD'));

INSERT INTO TB_USUARIO_EMPRESA (id_usuario, id_empresa, cargo, data_inicio)
VALUES (4, 11, 'Planejador de Frota', TO_DATE('2023-02-10','YYYY-MM-DD'));

-- Recomendações
INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (1, 1, 7, 78.5, 'IA', 'PENDENTE', TO_DATE('2024-05-01','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (2, 2, 9, 88.2, 'IA', 'EM_ANDAMENTO', TO_DATE('2024-04-20','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (3, 3, 4, 74.1, 'MANUAL', 'CONCLUIDA', TO_DATE('2024-03-15','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (4, 4, 6, 69.5, 'EMPRESA', 'EM_ANDAMENTO', TO_DATE('2024-04-05','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (5, 5, 3, 92.3, 'IA', 'PENDENTE', TO_DATE('2024-05-12','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (6, 6, 5, 65.0, 'EMPRESA', 'PENDENTE', TO_DATE('2024-02-27','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (7, 7, 2, 81.4, 'IA', 'CONCLUIDA', TO_DATE('2024-01-30','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (8, 8, 1, 63.3, 'MANUAL', 'PENDENTE', TO_DATE('2024-03-02','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (9, 9, 8, 94.6, 'IA', 'EM_ANDAMENTO', TO_DATE('2024-05-08','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (10, 10, 10, 71.8, 'EMPRESA', 'PENDENTE', TO_DATE('2024-04-12','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (11, 11, 6, 84.2, 'MANUAL', 'EM_ANDAMENTO', TO_DATE('2024-05-20','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (12, 12, 9, 79.3, 'IA', 'PENDENTE', TO_DATE('2024-05-18','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (13, 13, 11, 68.7, 'EMPRESA', 'PENDENTE', TO_DATE('2024-04-28','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (14, 14, 8, 90.5, 'IA', 'EM_ANDAMENTO', TO_DATE('2024-05-22','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (15, 15, 14, 73.9, 'MANUAL', 'CONCLUIDA', TO_DATE('2024-03-19','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (16, 1, 12, 86.0, 'EMPRESA', 'PENDENTE', TO_DATE('2024-05-24','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (17, 5, 15, 66.4, 'IA', 'PENDENTE', TO_DATE('2024-05-21','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (18, 7, 13, 77.2, 'EMPRESA', 'EM_ANDAMENTO', TO_DATE('2024-04-30','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (19, 9, 16, 88.8, 'IA', 'PENDENTE', TO_DATE('2024-05-25','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (20, 16, 10, 71.0, 'EMPRESA', 'EM_ANDAMENTO', TO_DATE('2024-04-07','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (21, 4, 9, 64.9, 'MANUAL', 'PENDENTE', TO_DATE('2024-02-25','YYYY-MM-DD'));

INSERT INTO TB_RECOMENDACAO (id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao)
VALUES (22, 12, 2, 85.6, 'IA', 'CONCLUIDA', TO_DATE('2024-03-05','YYYY-MM-DD'));
