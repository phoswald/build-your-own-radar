
# Usage

```
$ sudo rm -rf samples/radar.* volumes && \
  mkdir -p volumes/dist && \
  mkdir -p volumes/opt && \
  sudo chmod 777 samples volumes/* 

$ docker build -t build-your-own-radar .

$ docker run -it --rm \
  -p 8080:8080 \
  -e SERVER_NAMES="localhost 127.0.0.1" \
  -v "$PWD/samples/":/opt/build-your-own-radar/files \
  -v "$PWD/volumes/dist/":/src/build-your-own-radar/dist \
  -v "$PWD/volumes/opt/":/opt/build-your-own-radar \
  build-your-own-radar:latest

$ open http://localhost:8080/?documentId=http%3A%2F%2Flocalhost%3A8080%2Ffiles%2Fempty-radar.csv
$ open http://localhost:8080/?documentId=http%3A%2F%2Flocalhost%3A8080%2Ffiles%2Fsample-radar.csv
```
