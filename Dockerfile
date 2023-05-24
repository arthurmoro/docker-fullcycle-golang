FROM golang:1.20.4-alpine as builder
WORKDIR /app


COPY . .

RUN go mod init app
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app

FROM scratch 
COPY --from=builder /app/app /app
CMD [ "/app" ]