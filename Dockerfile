FROM rust:1.83-alpine as builder

WORKDIR /app
COPY . .
RUN cargo install --path .

FROM alpine:3.9 as runner

COPY --from=builder /usr/local/cargo/bin/cliuno-rocket-template /usr/local/bin/cliuno-rocket-template
COPY --from=builder /app/.env .env
COPY --from=builder /app/Rocket.toml Rocket.toml

EXPOSE 8080

CMD ["cliuno-rocket-template"]