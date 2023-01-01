<p align="center">
  <img src="https://i.imgur.com/9rNheaN.png" width="400" />
</p>

O [DOMJudge](https://www.domjudge.org/) é um sistema open source automatizado para rodar campeonatos de programação. Esse repositório tem como objetivo ajudar o [PET SI](https://www.instagram.com/petsieach/) a utilizá-lo em seus projetos, como, por exemplo, o BXCOMP.

<br/>

## :owl: Para os petianos

Há um manual e vídeos complementares mais específicos sobre como subir e utilizar o DOMJudge no drive :) <br/>

<br/>

## 💻 DOMJudge

O Domjudge é composto por 3 partes principais:<br/>

-   Mariadb: Banco de dados
-   DomServer: Servidor do Domjudge
-   JudgeHost: testa os programas

Para utilizar o DomJudge nós temos algumas opções de infraestrutura. Podemos utilizar uma máquina na AWS, usar o nosso próprio PC, ou então misturar os dois. No nosso caso, vamos colocar o mariadb e o domserver na AWS e o judgeHost numa máquina local.

<br/>

## :cloud: DomJudge na AWS

1. Crie uma instância gratuita na AWS
2. Instale o git e docker-compose na máquina <br/>
`sudo amazon-linux-extras install docker`<br/>
`sudo service docker start`<br/>
`sudo usermod -a -G docker ec2-user`<br/>
`sudo chkconfig docker on`<br/>
`sudo yum install -y git`<br/>
 `sudo reboot` // Após esse comando, a máquina irá reiniciar e pode travar um pouco. Desconecte-se e conecte-se novamente<br/> 
`sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose`<br/>
`sudo chmod +x /usr/local/bin/docker-compose`<br/>
Para verificar se deu certo, rode o seguinte comando: `docker-compose version`. A saída deve ser "Docker Compose version x.xx.x."<br/>
3. Clone este repositório<br/>
`git clone https://github.com/Anemaygi/domjudge.git` <br/>
4. Entre na subpasta domjudge<br/>
`cd domjudge/domjudge`<br/>
5. Renomeie o ".env.example" para ".env"<br/>
`mv .env.example .env`<br/>
6. Atualize o .env com as informações que faltam<br/>
`As credenciais do banco de dados estão no manual disponível no drive :)`<br/>
6. Utilize o container<br/>
    a. Inicializando o container pela primeira vez: `docker-compose up -d` <br/>
    b. Parando o container (quando irá usá-lo novamente): `docker-compose stop`<br/>
    c. Startando o container (quando ele está parado): `docker-compose start`<br/>
    d. Descendo o container (perde as informações): `docker-compose down`<br/>

<br/>

## :electric_plug: JudgeHost na máquina local

1. Instale git e docker-compose se não tiver<br/>
2. Dê clone neste repositório<br/>
`git clone https://github.com/Anemaygi/domjudge.git`<br/>
3. Entre na subpasta judgehost<br/>
`cd domjudge/judgehost` <br/>
4. Renomeie o ".env.example" para ".env"<br/>
`mv .env.example .env`
5. Atualize o .env

```
Além das credenciais do banco de dados, que são as mesmas do DomJudge, temos que preencher:
- DOMSERVER_BASEURL é o ipv4 público da instância na AWS (onde o domjudge está)
- JUDGEDAEMON_PASSWORD é a senha que o container do DomServer gerou para o JudgeHost. Para encontrá-la, dê "docker-compose logs | grep "judgehost"" na instância AWS.
```
6. Utilize o container<br/>
    a. Inicializando o container pela primeira vez: `docker compose up -d` <br/>
    b. Parando o container (quando irá usá-lo novamente): `docker compose stop`<br/>
    c. Startando o container (quando ele está parado): `docker compose start`<br/>
    d. Descendo o container (perde as informações): `docker compose down`<br/>

<br/>

## :heavy_plus_sign: Orientações

### Quando desligar (e ainda será utilizado na próxima etapa)

#### Na máquina local do judgehost

`docker compose stop`

#### Na instância AWS rodando o DOMServer

`docker compose stop`

depois, ir na instância e pará-la.

![instancia](https://i.imgur.com/7Jn51Ad.png) 
