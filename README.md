
# oracle-alive

容器化[layou233/NeverIdle](https://github.com/layou233/NeverIdle)，Oracle 甲骨文保活，已在Oracle AMD和ARM机器上测试运行。

## Usage

### 1. docker cli

```shell
# 删除已有的容器
docker rm -f oracle-alive

# 默认值启动, 消耗1G内存，AMD和大内存ARM机器需要自己指定参数，见下方
docker run -idt --name oracle-alive --restart=always wbchn/oracle-alive:latest

# 自定义参数: 自用AMD机器
docker run -idt --name oracle-alive --restart=always wbchn/oracle-alive:latest /app/NeverIdle -c 1h17m -n 2h3m

# 自定义参数: 自用ARM机器
docker run -idt --name oracle-alive --restart=always wbchn/oracle-alive:latest /app/NeverIdle -c 1h17m -m 2 -n 2h3m
```

### 2. docker compose

```
wget https://github.com/wbchn/oracle-alive/raw/master/docker-compose.yaml
docker compose up -d
```

## Build

```shell
docker buildx create --use

VER=0.1
# building an image for platforms
docker buildx build --platform linux/amd64,linux/arm64 --build-arg VERSION=$VER -t wbchn/oracle-alive:latest -t wbchn/oracle-alive:${VER} --push .
```

## Other

[1] [layou233/NeverIdle](https://github.com/layou233/NeverIdle)