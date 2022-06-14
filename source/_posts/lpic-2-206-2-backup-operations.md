---
extends: _layouts.post
section: content
title: 206.2 Backup Operations 
date: 2022-06-08
description: 206.2 Candidates should be able to use system tools to back up important system data. 
cover_image: /assets/img/post-cover-image-2.png
published: true
---

## tar

Para criar um arquivo com os arquivos agrupados

    tar cvf backup.tar ./

Para criar os arquivos compactados com gzip

    tar cvfz backup.tar.gz ./    

Para criar os arquivos mas sem compactar o arquivo com o nome "*.tar.gz"

    tar cvfz backup.tar.gz --exclude="*.tar.gz" ./    

## Realizando backups para uma fita usando o tar

Em vez de colocar o nome do arquivo de destino (arquivo.tar.gz) se coloca o dispositivo de destino. O nome do destino pode ser **/dev/nst0** ou **/dev/st0**. O **0** pode mudar pra **1** ou **2**.

Esse tipo de dispositivo não se monta e nem se cria um sistema de arquivo nesse dispositivo.

## Lendo backups de uma fita

Se coloca apenas o local dispositivo e se lé o com **x** !(ler nao é com -l ou --list)

    tar -xvf  /dev/st0



### /dev/nst0

O dispositivo que começa com **n** não rebobina a fita 

### /dev/st0

O dispositivo que começa com **s** rebobina a fita


    tar cvfz /dev/nst0 /etc





## /bin/sh

## dd

## tar

## /dev/st* and /dev/nst*

## mt

## rsync