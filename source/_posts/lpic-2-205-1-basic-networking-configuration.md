---
extends: _layouts.post
section: content
title: 205.1 Basic networking configuration
date: 2021-11-03
description: 205.1 Basic networking configuration
cover_image: /assets/img/post-cover-image-2.png
published: true
---

## ip


## ifconfig

Comando para exibir informações sobre as interfaces de rede. Passando como parametro o nome da inteface vemos apenas informações sobre essa interface

Exibe todas as inrtefaces rodando, ou seja, em estado up.

    $ ifconfig

Exibe todas as interfaces, incluse as em estado down

    $ ifconfig -a

Exibe uma interface

    $ ifconfig enp1s0 
    enp1s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
    inet 192.168.1.114  netmask 255.255.255.0  broadcast 192.168.1.255
    inet6 fe80::da7f:4ec9:4986:b7c2  prefixlen 64  scopeid 0x20<link>
    ether fc:aa:14:fd:38:7e  txqueuelen 1000  (Ethernet)
    RX packets 30136  bytes 39200883 (37.3 MiB)
    RX errors 0  dropped 0  overruns 0  frame 0
    TX packets 10639  bytes 1246410 (1.1 MiB)
    TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

* **enp1s0** é o nome da interface
* **inet** é o enderço ipv4
* **inet6** é o enderço ipv6
* **ether** é o MAC address
* **RX** são os pacotes recebidos
* **TX** são os transmitidos


Para baixar uma interface

    $ ifconfig enp1s0 down

Para subir uma interface

    $ ifconfig enp1s0 up


Para atribuir um IP. Como não passei uma mascara será atribuida a mascara padrão de acordo com o ip

    $ ifconfig enp1s0 10.0.0.5 


Passando a mascara

    $ ifconfig enp1s0 10.10.0.5 netmask 255.255.255.0

Atribuindo mais de um ip para a interface **(sim isso é possivel)**

    $ ifconfig enp1s0:0 10.0.0.6 

ou

    $ ifconfig enp1s0 add 10.0.0.6 


Mudar o MAC da placa de rede **(sim isso é possivel)**

    $ ipcofig enp1s0 hw ether 08:08:08:08:08:08 


## route



## arp


## iw


## iwconfig


## iwlist

