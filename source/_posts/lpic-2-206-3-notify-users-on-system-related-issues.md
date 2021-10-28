---
extends: _layouts.post
section: content
title: 206.3 Notify users on system-related issues

date: 2021-10-27
description: 206.3 Notify users on system-related issues
cover_image: /assets/img/post-cover-image-2.png
published: true
---

## ​Automate communication with users through logon messages



## Inform active users of system maintenance


## /etc/issue

É um arquivo que contem as informações que aparecem na tela antes de logar no terminal.


## /etc/issue.net

É um arquivo que contem as informações que aparecem na tela antes de logar via ssh ou telnet. Para funcionar é preciso configurar no arquivo de configuração do ssh a opção Banner  /etc/issue.net


# /etc/motd

E outro arquivo de mensagem. motd significa Message Of The Day

Essa mensagem aparece depois que o usuario faz login na maquina.


## wall

Manda mensagem para todos os usuários logados no sistema

    $ wall "my simple message"

Podemos mandar um arquivo

    $ cat /etc/passwd | wall


## /sbin/shutdown

Desliga a maquina daqui 1 minuto

    $ shutdown 

Desliga a maquina daqui 5 minutos e informa os usuarios

    $ shutdown +5

Desliga a maquina agora

    $ shutdown now

Reinica a maquina agora

    $ shutdown now -r

Cancela a opção de shutdown

    $ shutdown -c


## systemctl

## halt

 Para a maquna masnão desliga

## powerof

Ele para a maquina e desliga a energia da maquina

## reboot