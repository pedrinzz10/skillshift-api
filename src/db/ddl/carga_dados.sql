-- SCRIPT: SkillShift.AI - Banco de Dados (Oracle)
-- Autor: Equipe SkillShift
-- Disciplina: Building Relational Database - FIAP

-- DML (Script Master)
-- Este arquivo apenas orquestra a execução dos blocos menores de carga
-- para evitar travamentos no SQL Developer.

WHENEVER SQLERROR EXIT SQL.SQLCODE;
SET DEFINE OFF;

PROMPT ========================================
PROMPT = SkillShift.AI - Carga de Dados       =
PROMPT ========================================

PROMPT [1/6] Populando usuários...
@carga_dados_01_usuarios.sql

PROMPT [2/6] Populando cursos...
@carga_dados_02_cursos.sql

PROMPT [3/6] Populando empresas...
@carga_dados_03_empresas.sql

PROMPT [4/6] Relacionando usuários e empresas...
@carga_dados_04_usuario_empresa.sql

PROMPT [5/6] Populando recomendações...
@carga_dados_05_recomendacoes.sql

PROMPT [6/6] Inserindo aliases de cursos...
@carga_dados_06_aliases.sql

PROMPT ========================================
PROMPT = Carga finalizada com sucesso!        =
PROMPT ========================================
