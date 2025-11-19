# skillshift-api

Projeto backend do SkillShift.AI desenvolvido com Quarkus (Java 21) e JDBC puro.

## Execucao em modo desenvolvimento

Rode o modo dev (com live coding) com:

```shell
./mvnw quarkus:dev
```

A Dev UI fica disponivel apenas neste modo: <http://localhost:8080/q/dev/>.

## Empacotamento e execucao

Gere o pacote padrao:

```shell
./mvnw package
```

O arquivo `quarkus-run.jar` aparece em `target/quarkus-app/` e deve ser executado via `java -jar target/quarkus-app/quarkus-run.jar`. As dependencias ficam em `target/quarkus-app/lib/`.

Para gerar um uber-jar:

```shell
./mvnw package -Dquarkus.package.jar.type=uber-jar
```

Depois execute com `java -jar target/*-runner.jar`.

## Binario nativo

Crie um executavel nativo com:

```shell
./mvnw package -Dnative
```

Sem GraalVM instalada, use o build em container:

```shell
./mvnw package -Dnative -Dquarkus.native.container-build=true
```

O binario final ficara em `target/skillshift-api-1.0.0-SNAPSHOT-runner`.

## Referencias uteis

- Hibernate Validator: <https://quarkus.io/guides/validation>
- SmallRye OpenAPI (Swagger UI): <https://quarkus.io/guides/openapi-swaggerui>
- REST Jackson: <https://quarkus.io/guides/rest#json-serialisation>
- JDBC Oracle: <https://quarkus.io/guides/datasource>

## Scripts SQL do banco

Os scripts oficiais para criar e popular o schema Oracle ficam em `src/db/ddl/`:

- `create_tables.sql`: recria todas as tabelas seguindo o padrão `t_skillshift_<dominio>` (PK, FK, UK, CK e identidades).
- `drop_tables.sql`: remove as tabelas na ordem correta.
- `carga_dados.sql`: insere a massa de teste padrão do SkillShift.AI (mais de 100 cursos tecnológicos, aliases e dados para empresas).
- `../dql/consultas.sql`: contém consultas analíticas (DQL/DRS) usadas para tomada de decisão.

Estruturas extras:
- `t_skillshift_curso_alias`: auxilia o pareamento entre os nomes retornados pela IA e os cursos reais.
- `t_skillshift_recomendacao_ia_log`: registra cada chamada ao serviço de IA (payload enviado/recebido, cluster e erro, se houver).
- `t_skillshift_recomendacao` possui as colunas `cluster_id` e `payload_ia` para rastrear metadados das recomendações automáticas.

## Deploy no Render (Docker)

1. Configure as variáveis de ambiente no painel do Render:
   - `QUARKUS_DATASOURCE_JDBC_URL`
   - `QUARKUS_DATASOURCE_USERNAME`
   - `QUARKUS_DATASOURCE_PASSWORD`
   - (opcional) `SKILLSHIFT_IA_URL`
2. Crie um serviço do tipo **Web Service** com `Language = Docker`.
3. Aponte o campo **Dockerfile Path** para `Dockerfile` (raiz do projeto). O arquivo é multi-stage: compila com `./mvnw package -DskipTests` e copia o conteúdo para a imagem final.
4. O container expõe a porta 8080; o Render usará `PORT` automaticamente.

Execute-os nessa sequência antes de subir a API para garantir alinhamento entre o banco e as validações impostas no código.

## Recursos REST de exemplo

O projeto gerado contem um recurso REST inicial para servir de demonstracao. Mais detalhes: <https://quarkus.io/guides/getting-started-reactive#reactive-jax-rs-resources>
