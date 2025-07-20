FROM ubuntu:22.04

RUN apt update && apt install -y curl git build-essential

# Установка Go
RUN curl -LO https://golang.org/dl/go1.20.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"

# Клонируем репу Monad
RUN git clone https://github.com/monad-labs/monad.git /monad

# Собираем
WORKDIR /monad
RUN make build

# Запуск
CMD ["./build/monad", "node", "start"]
