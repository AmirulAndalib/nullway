FROM python:alpine

RUN git clone https://github.com/AmirulAndalib/railwaysaxx auto

RUN cd auto && cp ./content /workdir/

RUN apk update && apk add --no-cache curl caddy jq bash runit tzdata ttyd p7zip findutils \
    && chmod +x /workdir/service/*/run /workdir/service/*/log/run /workdir/*.sh \
    && /workdir/install.sh \
    && rm -rf /workdir/install.sh /tmp/* ${HOME}/.cache

ENTRYPOINT ["sh","/workdir/entrypoint.sh"]
