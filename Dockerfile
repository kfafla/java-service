# 构建阶段
FROM openjdk:17-slim AS build
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME

# 确保 mvnw 文件存在并具有可执行权限
RUN ls -l ./mvnw && chmod +x ./mvnw

# 运行 Maven 构建
RUN --mount=type=cache,target=/root/.m2 ./mvnw -f /usr/app/pom.xml clean package

# 打包阶段
FROM openjdk:17-slim
ARG JAR_FILE=/usr/app/target/*.jar
COPY --from=build $JAR_FILE /app/runner.jar
EXPOSE 8081
ENTRYPOINT java -jar /app/runner.jar