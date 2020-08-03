FROM alpine

ENV CONFIG=https://gist.githubusercontent.com/tlmoe/1b85d31d378bee0f0eac3a016e11fbdd/raw/431fbf231d0491b35e23ba1821d261cd94648514/config.json

RUN apk update && apk --no-cache add ca-certificates unzip && \
    wget -c https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip && rm -f v2ray-linux-64.zip && \
    chmod 700 v2ray v2ctl
    
CMD ./v2ray -config $CONFIG
