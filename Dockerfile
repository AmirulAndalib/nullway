FROM ghcr.io/amirulandalib/seeshbox:latest

COPY . .

ENTRYPOINT ["sh","/workdir/entrypoint.sh"]
