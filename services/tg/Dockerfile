FROM golang:alpine

WORKDIR /opt/app

COPY ./services/tg/tg-service /opt/app/tg-service
COPY ./services/tg/config.json /opt/app/config.json

EXPOSE 5243

CMD ["/opt/app/tg-service"]
