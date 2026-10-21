FROM golang:1.26

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod tidy

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o main .

EXPOSE 3000

CMD ["./main"]

