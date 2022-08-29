FROM golang:latest as temp-go

COPY ./ssl/src/ /app/src/
WORKDIR /app/src
RUN go build -o /app/app


FROM nginx:stable as gateway

COPY ./docker/conf/ /etc/nginx/

RUN mkdir /root/ssl

COPY --from=temp-go /app/app /root/ssl/app

WORKDIR /root/ssl