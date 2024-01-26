FROM khipu/openjdk17-alpine
MAINTAINER mellivorines
WORKDIR /dev/service
COPY /build/libs/blog-0.0.1.jar blog-0.0.1.jar

EXPOSE 8080

CMD ["java","-Xmx512m","-Xms512m","-jar", "blog-0.0.1.jar"]