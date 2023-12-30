FROM alpine:latest
ADD dist/go-boilerplate-starter_linux_amd64_docker/go-boilerplate-starter /bin/go-boilerplate-starter
RUN chmod +x /bin/go-boilerplate-starter
RUN apk update && \
    apk --no-cache add ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
EXPOSE 8080
CMD [ "/bin/go-boilerplate-starter" ]
