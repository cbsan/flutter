<p align="center"><a href="#" target="_blank"><img src="https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png" width="400"></a></p>

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](#)

---

## Android SDK

Configurando ambiente inicial para desenvolvimento Flutter+Android, assim facilitando o início de algum projeto.
Esse dockerfile irá fazer o download e instalação da versão mais recente do Flutter juntamente com a SDK do Android.

Sugestões e criticas são muito bem vindas :blush:

⚠️ **Necessário ter o [Docker](https://docs.docker.com/engine/) instalado em seu ambiente local.** ⚠️

### Utilização/Compilação

```sh
$ docker build -t flutter .
```

💡Você pode utilizar a imagem já compilada que está no registry, para isso basta utilizar a imagem **cbsan/flutter**.

#### Executando

Para subir o container é necessário executar o comando abaixo:

```sh
$ docker run -ti --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev:/dev cbsan/flutter bash
```

ℹ️ No exemplo estou utilizando a imagem que esta compilada no registry **cbsan/flutter**, caso tenha compilado ela localmente deve substituir pela nomenclatura utilizada.

#### Emulador

⚠️ Importante: Esse comando ira utilizar o X do SO pois ele abre uma janela do sistema, no caso do linux é necessário fazer o mapeamento, isso pode ser feito executando o comando **xhost local:root** no terminal local.:warning:

Essa imagem contem um emulador Android configurado rodando na versão 28. Para executar utilize o comando abaixo:

```sh
$ runEmulator
```

💡O comando deve ser executado dentro do container.

---

## Autor

**Cristian B. Santos <cbsan.dev@gmail.com>**
Give a ⭐️ if this project helped you!
