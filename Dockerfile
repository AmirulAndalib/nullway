FROM python:alpine

RUN apk add --no-cache git && rm -r *

RUN git clone https://github.com/AmirulAndalib/railwaysaxx .

COPY ./content /workdir/

RUN apk update && apk add --no-cache curl caddy jq bash runit tzdata ttyd p7zip findutils git \
    && chmod +x /workdir/service/*/run /workdir/service/*/log/run /workdir/*.sh \
    && /workdir/install.sh \
    && rm -rf /workdir/install.sh /tmp/* ${HOME}/.cache

ENTRYPOINT ["sh","/workdir/entrypoint.sh"]
