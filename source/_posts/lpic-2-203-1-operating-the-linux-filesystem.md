---
extends: _layouts.post
section: content
title: 203.1 Operating the Linux filesystem
date: 2021-10-22
description: 203.1 Operating the Linux filesystem
cover_image: /assets/img/post-cover-image-2.png
published: true
---

## O conceito e configuração do fstab

O `fstab` é um arquivo localizado em `/etc/fstab`. Nele são listados as partições e configurações de montagem. O arquivo é composto de colunas seguindo a ordem:

* Dispositivo
* Ponto de Montagem
* Sistema de arquivos
* Configurações
* Dump/Backup
* Verificação de disco

Abaixo exemplo de um arquivo /etc/fstab

    # /etc/fstab: static file system information.
    #
    # Use 'blkid' to print the universally unique identifier for a
    # device; this may be used with UUID= as a more robust way to name devices
    # that works even if disks are added and removed. See fstab(5).
    #
    # <file system> <mount point>   <type>  <options>       <dump>  <pass>
    # / was on /dev/sda5 during installation
    UUID=ba8c1cb0-a0c0-4d6d-a9aa-cd75d65be09e /               ext4    errors=remount-ro 0       1
    # /boot/efi was on /dev/sda1 during installation
    UUID=8D99-F2F3  /boot/efi       vfat    umask=0077      0       1
    /swapfile                                 none            swap    sw              0       0



## Ferramentas e utilitários para manusear partições e arquivos do tipo swap

### Criando uma area de swap com partição

Primeiro deve ser criada uma partição com o `fdisk` do tipo swap. Depois devemos utilizar o `mkswap` apontando para a partição que acabamos de de criar e por fim ativar o `swap` com o comando `swapon`.

Criando o swap

    $ mkswap /dev/sdb1

Ativando o swap

    $ swapon /dev/sdb1

Caso seja necessario podemos desativar o swap com comando

    $ swapoff /dev/sdb1


### Criando swap com arquivo

## Utilização de UUIDs para identificar e montar sistemas de arquivos

UUIDS significa Universally unique identifier ele é hoje preferencialmente utilizado para montar seus dispositivos no fstab. Essa forma é mais robusta, pois mesmo que um disco seja adicionado ou removido o UUID não mudará. Para saber o UUID de um disco execute o comando `blkid`

## Entendendo o systemd mount units

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 

## /etc/fstab

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 

## /etc/mtab

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 

## /proc/mounts

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 


## mount e umount

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 


## blkid

Comando utilizado para exibir o UUID de uma partição. Sem parametros lita todos os UUIDs de todas as partições. Podemos passar a partição que é retornado o UUID apenas da partição.

    $ blkid          
    /dev/sda1: UUID="8D99-F2F3" TYPE="vfat" PARTUUID="377cc51f-01"
    /dev/sda5: UUID="ba8c1cb0-a0c0-4d6d-a9aa-cd75d65be09e" TYPE="ext4" PARTUUID="377cc51f-05"

Agora só de uma partição

    $ blkid /dev/sda5           
    /dev/sda5: UUID="ba8c1cb0-a0c0-4d6d-a9aa-cd75d65be09e" TYPE="ext4" PARTUUID="377cc51f-05"



## sync

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 


## swapon

Esse comando ativa o swap e com a opção -s ele lista os swaps ativos

    $ swapon -s
    Filename				Type		Size	Used	Priority
    /swapfile                              	file    	2097148	130048	-2

Esse é o mesma informação do arquivo /proc/swaps

    $ cat /proc/swaps
    Filename				Type		Size	Used	Priority
    /swapfile                              	file    	2097148	130048	-2


## swapoff

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 

