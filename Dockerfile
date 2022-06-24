FROM python:alpine

RUN apk add --upgrade git 

RUN git clone https://github.com/AmirulAndalib/Leech-AIO-APP-EX .

COPY ./content /workdir/

RUN apk update && apk add --upgrade rclone aria2 aria2-daemon && apk add --no-cache curl caddy jq bash runit tzdata ttyd p7zip findutils \
    && chmod +x /workdir/service/*/run /workdir/service/*/log/run /workdir/*.sh \
    && /workdir/install.sh \
    && rm -rf /workdir/install.sh /tmp/* ${HOME}/.cache

ENTRYPOINT ["sh","/workdir/entrypoint.sh"]
