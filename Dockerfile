FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/chetanya95/google-sel-testng.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/google-sel-testng/testng-test /app
RUN ls -al
CMD ["sh","-c","mvn clean test -e && export my_folder=report_$(date +%Y%m%d_%H%M%S) && mkdir /data/${my_folder} && cp -R /app/target/surefire-reports /data/${my_folder} && echo Reports stored in ${my_folder}"]
#CMD mvn test -e
