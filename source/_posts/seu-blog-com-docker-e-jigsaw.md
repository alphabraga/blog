---
extends: _layouts.post
section: content
title: Seu blog com Docker e Jigsaw
date: 2021-07-21
description: Crie seu blog estatico com Jigsaw, Docker e Netlify 
cover_image: /assets/img/post-cover-image-2.png
featured: true
categories: [configuration]
published: true
---

Crie seu blog estatico com Jigsaw, Docker e Netlify .<!-- more -->

## O seu Dockerfile

Aqui vamos utilizar o `Docker` para criar o ambiente perfeito e portavel para seu blog. 

Crie o diretorio do seu projeto. Vamos chamar de `blog`:

```bash
mkdir blog && cd blog
```

Agora crie na raiz do projeto um arquivo chamado Dockerfile com o conteúdo abaixo:

```text
FROM php:7.4

RUN apt-get update && \
    apt-get install --yes \
    git \ 
    zip \ 
    curl

ENV NODE_VERSION=12.14.0
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

RUN curl -sS https://getcomposer.org/installer | \ 
    php -- --install-dir=/usr/local/bin \ 
    --filename=composer

WORKDIR /app

EXPOSE 8000
```


Vamos criar uma imagem baseada nesse arquivo com o comando abaixo:

```bash
$ sudo docker build -t blog .
```

Vamos subir um container baseado nessa imagem

```bash
$ sudo docker run --name=meu-blog -p8000:8000 -v=$(pwd)/:/app -dit blog
```

Vamos subir um container baseado nessa imagem

```bash
$ sudo docker exec -it meu-blog composer require tightenco/jigsaw
```

Vamos subir um container baseado nessa imagem

```bash
$ sudo docker exec -it meu-blog composer require tightenco/jigsaw
```
Vamos subir um container baseado nessa imagem

```bash
sudo docker exec -it meu-blog ./vendor/bin/jigsaw build
```

Vamos subir um container baseado nessa imagem

```bash
sudo docker exec -it meu-blog ./vendor/bin/jigsaw serve --host=0.0.0.0
```