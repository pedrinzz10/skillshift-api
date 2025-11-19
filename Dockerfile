# syntax=docker/dockerfile:1.7

# Stage 1 - Build
FROM quay.io/quarkus/ubi-quarkus-mandrel-builder-image:23.1-java21 AS build
WORKDIR /workspace
COPY . .
RUN chmod +x mvnw
RUN ./mvnw package -DskipTests

# Stage 2 - Runtime
FROM registry.access.redhat.com/ubi9/openjdk-21:1.23
ENV QUARKUS_HOME=/deployments
WORKDIR ${QUARKUS_HOME}
COPY --from=build /workspace/target/quarkus-app/lib/ ./lib/
COPY --from=build /workspace/target/quarkus-app/*.jar ./
COPY --from=build /workspace/target/quarkus-app/app/ ./app/
COPY --from=build /workspace/target/quarkus-app/quarkus/ ./quarkus/
EXPOSE 8080
CMD ["java","-jar","/deployments/quarkus-run.jar"]
