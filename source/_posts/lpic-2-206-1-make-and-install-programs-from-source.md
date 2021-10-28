---
extends: _layouts.post
section: content
title: 206.1 Make and install programs from source
date: 2021-10-22
description: 206.1 Make and install programs from source
cover_image: /assets/img/post-cover-image-2.png
published: true
---

## Unpack source code using common compression and archive utilities


Para decompactar e descomprimir um codigo fonte você vai utilizar o

    $ tar {parametro}xvpf nome-arquivo.tar.{extensao}


* `z` para gzip, gz
* `J` para xz
* `j` para bz2

## Understand basics of invoking make to compile programs

## Apply parameters to a configure script


## Saber onde os fontes são guardados

Por padrão os codigo fonte ficam em `/usr/src` isso é uma recomendação.

## gunzip

Esse comando é utilizado para descompactar arquivos `tar.gz`.

    $ gunzip nome-arquivo.tar.gzip

Ele só serve para descompactar. Sendo assim um arquivo com a extensão `.tar` sera criaddo em seu diretorio. 

    $ tar xvpf nome-arquivo.tar 

## gzip

## bzip2

## xz

## tar

Para arquivos `.gz` utilize o `gunzip` ou:

    $ tar zxpvf nome-arquivo.tar.gz

Para arquivos `.xz`  use `unxz` ou:

    $ tar Jxpvf nome-arquivo.tar.xz

Para arquivos `.bz2` utiliza o `bunzip2`  ou:

    $ tar jxpvf nome-arquivo.tar.bz2

## configure

É um script de configuração presente em codigos fonte. É nele que é realizada a indentificação de componentes da maquina local. 

Devemos executar o configure

    $ ./configure

Podemos passar o parametro --prefix que determina onde queremos que o sofware seja instalado

    $ ./configure --prefix=/opt/teste

Como resultado da execução desse comando temos o Makefile    

A execução do configure

## make

O make realiza a compilação do codigo. Precisamos do `gcc` do build essenssials ou development tools.

Durante a compilação devemos verifcar se ainda falta alguma dependencia.


o `make install` copia os arquivos compiados para o diretorio padão do binarios do sistema

## uname

Esse comando retorna os dados do sistema. Com a opção -r temos a versão do kernel do sistema

## install

## patch

Ccomando que serve pra aplicar um patch apartir de um diff