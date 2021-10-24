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

O swap é uma area em disco que funciona como auxiliar para a mémoria do sistea. Se o seu sistema esta utilizando o swap de forma muito intensa provavelmente existe uma sobrecarga em seu sistema. Vale lembrar que o swap não é obrigatório.


### Criando uma area de swap com partição

Primeiro deve ser criada uma partição com o `fdisk` do tipo swap. Depois devemos utilizar o `mkswap` apontando para a partição que acabamos de de criar e por fim ativar o `swap` com o comando `swapon`.

Criando o swap

    $ mkswap /dev/sdb1

Ativando o swap

    $ swapon /dev/sdb1

Caso seja necessario podemos desativar o swap com comando

    $ swapoff /dev/sdb1


### Criando swap com arquivo

Primeiro criamos o arquivo com o comando dd:

    $ dd if=/dev/zero of=/swapfile   bs=1024k count=1000

Depois formatamos o swap com o mkswap

    $ mkswap /swapfile

Por fim adicionamos a area de swap com

    $ swapon /swapfile

Podemos verificar se o arquivo foi realmente adicionado com o comando

    λ$ cat /proc/swaps
    Filename                                Type            Size            Used            Priority
    /dev/sda4                               partition       16777212        0               -2
    /swapfile                               file            1023996         0               -3

Podemos utilizar tambem o `free` ou o `swapon -s`


## Utilização de UUIDs para identificar e montar sistemas de arquivos

UUIDS significa Universally unique identifier ele é hoje preferencialmente utilizado para montar seus dispositivos no fstab. Essa forma é mais robusta, pois mesmo que um disco seja adicionado ou removido o UUID não mudará. Para saber o UUID de um disco execute o comando `blkid`

## Entendendo o systemd mount units

É o systemctl que gerencia toda a montagem de discos no sistema. Ele inclusive lê as configurações do fstab alêm de possuir as proprias.

Os arquivos de configuração podem ser salvos em `/etc/systemd/system` ou em `/lib/systemd/system`

O nome do arquivo deve ser o caminho absoluto do ponto de montagem. Se eu desejo que o ponto de montagem seja o diretorio `/opt/pasta/aqui` o arquivo deve ficar assim:

    $ touch /etc/systemd/system/opt-pasta-aqui.mount

O arquivo deve conter o seguinte:

    [Unit]
    Description= Meu novo disco

    [Mount]
    What=/dev/sdb1
    Where=/opt/pasta/aqui
    Type=ext4
    Options=defaults

    [Install]
    WhantedBy=multi-user.target


Para ler as configurações e montar o disco executamos

    $ systemctl daemon-reload

Em seguida 

    $ systemctl start opt-pasta-aqui.mount

E podemos nos certificar que esta montado usando o parametro status

Para definir que a montagem ocorra durante a inicialização do sistema basta utilizar

    $ systemctl enable /opt/teste/aqui.mount


## /etc/mtab

Lista as partições montadas no sistema

## /proc/mounts

Lista as partições montadas no sistema

## mount e umount

Digitando só

    $ mount

Todas as parições montadas no sistema são exibidas

Que é o mesmo ouput dos comandos abaixo

    $ cat /proc/mounts

    $ cat /etc/mtab

### Principais parametros

Para definir o tipo de sistema de arquivos

    $ mount -t ext4 /dev/sdb1 /opt/test

Para montar por UUID

    $ mount -U ADDA-AAD-AWDAW-DA-DA-WD /opt/test

    $ mount UUID=ADDA-AAD-AWDAW-DA-DA-WD /opt/test

Por label

    $ mount LABEL=Minha Partição /opt/test

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

Esse é a mesma informação do arquivo /proc/swaps

    $ cat /proc/swaps
    Filename				Type		Size	Used	Priority
    /swapfile                              	file    	2097148	130048	-2


## swapoff

Comando que remove um partição ou arquivo da area de swap reconhecida do sistema

