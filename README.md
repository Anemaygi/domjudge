# DomJudge


## subir

docker compose up -d


## parar

docker compose stop


## restartar

docker compose restart


## no .env

### domjudge

- DOMSERVER_BASEURL é o ipv4 público da instância na AWS (onde o domjudge está)
- JUDGEDAEMON_PASSWORD é a senha que o container do DomServer gerou para o JudgeHost.