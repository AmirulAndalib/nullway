FROM python:alpine

RUN apk update && apk add --no-cache curl caddy jq bash runit tzdata ttyd p7zip findutils git \
    && git clone https://github.com/AmirulAndalib/railwaysaxx haskel
    && cd haskel && cp ./content /workdir/ \
    && chmod +x /workdir/service/*/run /workdir/service/*/log/run /workdir/*.sh \
    && /workdir/install.sh \
    && rm -rf /workdir/install.sh /tmp/* ${HOME}/.cache

ENTRYPOINT ["sh","/workdir/entrypoint.sh"]
