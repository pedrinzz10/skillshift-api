# Stage 1 - Build
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /workspace
COPY . .
RUN mvn -e -DskipTests package

# Stage 2 - Runtime
FROM eclipse-temurin:21-jre
ENV QUARKUS_HOME=/deployments
WORKDIR ${QUARKUS_HOME}

COPY --from=build /workspace/target/quarkus-app/lib/ ./lib/
COPY --from=build /workspace/target/quarkus-app/*.jar ./
COPY --from=build /workspace/target/quarkus-app/app/ ./app/
COPY --from=build /workspace/target/quarkus-app/quarkus/ ./quarkus/

EXPOSE 8080

CMD ["java","-jar","quarkus-run.jar"]
