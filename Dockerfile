#required PORTS: 9999
#required NETS: none
#required external VOLUMES: /data
#required ENV Vars
FROM alpine
RUN apk add --update
RUN apk add nodejs
RUN apk add mc
RUN apk add htop
#o app eh o diretorio de binarios e fontes, eh interno!!!
#se montar como externo, o COPY nao funcionara
#update: nao salva logs no /app: usar docker logs!!!
#VOLUME /app
#WORKDIR /app
COPY tserver.js .
#COPY . .
EXPOSE 9999
#para usar redirect, usar a sintaxe como shel nao como json
#CMD ["node","tserver.js > /var/log.txt"]
#shell
#CMD node tserver.js > /data/log.txt
CMD node tserver.js 
