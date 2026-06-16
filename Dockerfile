# 全部使用阿里云镜像，避免 Docker Hub 超时
FROM registry.cn-hangzhou.aliyuncs.com/acs/maven:3-jdk-8 AS builder
WORKDIR /app
COPY pom.xml .
COPY ruoyi-admin/pom.xml ruoyi-admin/
COPY ruoyi-common/pom.xml ruoyi-common/
COPY ruoyi-framework/pom.xml ruoyi-framework/
COPY ruoyi-generator/pom.xml ruoyi-generator/
COPY ruoyi-quartz/pom.xml ruoyi-quartz/
COPY ruoyi-system/pom.xml ruoyi-system/
RUN mvn dependency:go-offline -B -pl ruoyi-admin -am || true
COPY . .
RUN mvn clean package -DskipTests -pl ruoyi-admin -am

FROM registry.cn-hangzhou.aliyuncs.com/acs/maven:3-jdk-8
WORKDIR /app
COPY --from=builder /app/ruoyi-admin/target/ruoyi-admin.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
