-- SCRIPT: SkillShift.AI - Banco de Dados (Oracle)
-- Autor: Equipe SkillShift
-- Disciplina: Building Relational Database - FIAP

-- DML
-- Aliases para facilitar o pareamento com a IA

INSERT INTO t_skillshift_curso_alias (id_curso, termo)
SELECT id_curso, 'Atendimento IA Google'
  FROM t_skillshift_curso
 WHERE nome = 'Atendimento Inteligente com IA - Google' AND ROWNUM = 1;

INSERT INTO t_skillshift_curso_alias (id_curso, termo)
SELECT id_curso, 'Atendimento IA IBM'
  FROM t_skillshift_curso
 WHERE nome = 'Atendimento Inteligente com IA - IBM' AND ROWNUM = 1;

INSERT INTO t_skillshift_curso_alias (id_curso, termo)
SELECT id_curso, 'Automacao Industrial Microsoft'
  FROM t_skillshift_curso
 WHERE nome = 'Automacao Industrial Avancada - Microsoft' AND ROWNUM = 1;

INSERT INTO t_skillshift_curso_alias (id_curso, termo)
SELECT id_curso, 'Logistica Preditiva Amazon'
  FROM t_skillshift_curso
 WHERE nome = 'Analise Preditiva para Logistica - Amazon' AND ROWNUM = 1;

INSERT INTO t_skillshift_curso_alias (id_curso, termo)
SELECT id_curso, 'RPA Backoffice Siemens'
  FROM t_skillshift_curso
 WHERE nome = 'Robos de Processo para Backoffice - Siemens' AND ROWNUM = 1;

INSERT INTO t_skillshift_curso_alias (id_curso, termo)
SELECT id_curso, 'Visao Computacional Siemens'
  FROM t_skillshift_curso
 WHERE nome = 'Visao Computacional para Qualidade - Siemens' AND ROWNUM = 1;

INSERT INTO t_skillshift_curso_alias (id_curso, termo)
SELECT id_curso, 'Atendimento IA Accenture'
  FROM t_skillshift_curso
 WHERE nome = 'Atendimento Inteligente com IA - Accenture' AND ROWNUM = 1;

INSERT INTO t_skillshift_curso_alias (id_curso, termo)
SELECT id_curso, 'Logistica IA Deloitte'
  FROM t_skillshift_curso
 WHERE nome = 'Analise Preditiva para Logistica - Deloitte' AND ROWNUM = 1;

INSERT INTO t_skillshift_curso_alias (id_curso, termo)
SELECT id_curso, 'RPA Operacional PwC'
  FROM t_skillshift_curso
 WHERE nome = 'Robos de Processo para Backoffice - PwC' AND ROWNUM = 1;

INSERT INTO t_skillshift_curso_alias (id_curso, termo)
SELECT id_curso, 'Qualidade Visao Computacional EY'
  FROM t_skillshift_curso
 WHERE nome = 'Visao Computacional para Qualidade - EY' AND ROWNUM = 1;

COMMIT;
