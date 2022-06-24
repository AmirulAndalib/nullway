FROM python:alpine

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apk add --no-cache git

RUN git clone https://github.com/AmirulAndalib/railwaysaxx auto && cd auto && cp -r * /usr/src/app

COPY ./content /workdir/

RUN apk update && apk add --no-cache curl caddy jq bash runit tzdata ttyd p7zip findutils git \
    && chmod +x /workdir/service/*/run /workdir/service/*/log/run /workdir/*.sh \
    && /workdir/install.sh \
    && rm -rf /workdir/install.sh /tmp/* ${HOME}/.cache

ENTRYPOINT ["sh","/workdir/entrypoint.sh"]
