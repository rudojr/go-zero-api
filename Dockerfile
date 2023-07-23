# Golang base image
FROM golang:1.16-alpine as builder

# Set workdir
WORKDIR /app

# Copy mã nguồn của ứng dụng vào container
COPY . .

# Build ứng dụng Go
RUN go build -o main .

# Sử dụng một Alpine base image nhẹ hơn để chạy ứng dụng
FROM alpine:latest

# Set workdir
WORKDIR /app

# Copy binary từ builder container vào container mới
COPY --from=builder /app/main .

# Chạy ứng dụng Go
CMD ["./main"]
