FROM golang:latest as temp-go

COPY ./ssl/src/ /app/src/
WORKDIR /app/src
RUN go build -o /app/app


FROM nginx:stable as gateway

# user add
ARG UID
ARG GID

# add user with rights to hostuser folder
# -o means that user(group) will be created even if it already exists with specified id
# -g - sets specific group id number
# -m - creates home directory
# -u - sets specific user id number
# -g (for user) specify group name
RUN groupadd -o -g ${GID} hostuser && useradd -o -m -u ${UID} -g hostuser hostuser

COPY ./docker/conf/ /etc/nginx/

RUN mkdir /root/ssl

COPY --from=temp-go /app/app /root/ssl/app

WORKDIR /root/ssl