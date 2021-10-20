---
extends: _layouts.post
section: content
title: 205.2 Advanced Network Configuration and Troubleshooting
date: 2021-10-19
description: 205.2 Advanced Network Configuration and Troubleshooting
cover_image: /assets/img/post-cover-image-2.png
published: true
---

## ip

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 

## ifconfig

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 

## route

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 

## arp

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 

## netstat

O comando `netstat` lista conexões. Sem nenhum parametro ele lista todas as conexões do host.

O comando abaixo exibe as conecxões `tcp` com o -t e `udp`, com o -u,  em modo listen, com o -l, e não resolve os nomes dos ips e portas com o -n

    $ netstat -tuln
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 0.0.0.0:139             0.0.0.0:*               LISTEN     
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN     
    tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN     
    tcp        0      0 0.0.0.0:445             0.0.0.0:*               LISTEN     
    tcp        0      0 127.0.0.1:43651         0.0.0.0:*               LISTEN     
    tcp6       0      0 :::139                  :::*                    LISTEN     
    tcp6       0      0 :::22                   :::*                    LISTEN     
    tcp6       0      0 ::1:631                 :::*                    LISTEN     
    tcp6       0      0 :::445                  :::*                    LISTEN     
    tcp6       0      0 :::8000                 :::*                    LISTEN  

Podemos ainda adicionar a opção `-p` para exibir o processo responsável pela abertura da porta

    $ netstat -tulnp
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
    tcp        0      0 0.0.0.0:139             0.0.0.0:*               LISTEN      1695/smbd           
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      7085/sshd           
    tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      16744/cupsd         
    tcp        0      0 0.0.0.0:445             0.0.0.0:*               LISTEN      1695/smbd           
    tcp        0      0 127.0.0.1:43651         0.0.0.0:*               LISTEN      1439/containerd     

Com a opção `-c` o comando fica procurando de forma continua essas informações semelhando a um `tail -f`

Para listar a tabela de roteamento

    $ netstat -r
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
    default         _gateway        0.0.0.0         UG        0 0          0 enp1s0
    172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0

Ou
    $ netstat --route    
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
    default         _gateway        0.0.0.0         UG        0 0          0 enp1s0
    172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0

Para listar as interfaces de rede

    $ netstat -i
    Kernel Interface table
    Iface      MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
    br-5d551  1500        0      0      0 0             0      0      0      0 BMU
    docker0   1500    18345      0      0 0         31716      0      0      0 BMRU
    enp1s0    1500   201629      0      0 0         93890      2      0      0 BMRU
    lo       65536     7832      0      0 0          7832      0      0      0 LRU


## ss

O `ss` e o `netcat` são muito parecidos e possuiem praticamente as mesmas opções.


## lsof

O `lsof` lista arquivos abertos no sistema e já que uma conexão na verdade abre um arquivo esse comando se encaixa perfeitamente tambem para listar conexões abertas

O comando abaixo mostra as conexões abertas

    $ lsof -i

Conexões abertas na porta 22

    $ lsof -i :22

Conexões abertas no ip 127.0.0.1 na porta 22

    $ lsof -i @127.0.0.1:22

## ping, ping6

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 

## nc ou netcat

Comando utilizado para testar conexões em determinadas portas. Podemos utilizar no `nc` para testar se a porta `22` esta aberta para conexões dessa forma:

    $ nc 127.0.0.1 80
    SSH-2.0-OpenSSH_7.9p1 Debian-1+dde

É possivel tambem testar um intervalo de portas de um determinado host. No exemplo abaixo vamos utilizar as opções `-vz` o `v` é de verbose e o `z` apenas verifica se a porta esta aberta e não realiza a conexão, sem essa opção o nc iria se conectar.

    $ nc -vz 127.0.0.1 19-23
    nc: connect to 127.0.0.1 port 19 (tcp) failed: Connection refused
    nc: connect to 127.0.0.1 port 20 (tcp) failed: Connection refused
    nc: connect to 127.0.0.1 port 21 (tcp) failed: Connection refused
    Connection to 127.0.0.1 22 port [tcp/ssh] succeeded!
    nc: connect to 127.0.0.1 port 23 (tcp) failed: Connection refused

Podemos abrir portas em nosso host. No exemplo abaixo vamos abrir a porta `123`

    $ nc -l -p 123

De outro host podemos testar se essa porta esta de fato aberta e ate mesmo se conectar por essa porta e trocar mensagens.

Vamos se conectar na porta

    $ nc 127.0.0.01 123

Podemos trocar mensagens simplemente digitando um texto e presinando enter no final.

Todos esses comandos são importantes para testar conexões dentro de redes com firewalls e outros vatores que podem dificultar essas conexões.

## tcpdump

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel euismod velit, egestas congue tortor. Nulla erat dui, elementum et erat vitae, consequat mattis ipsum. Vivamus a sapien urna. Pellentesque porta malesuada nibh, vitae efficitur erat pretium vitae. 

## nmap

Lista prtas abertas

 $ nmap 127.0.0.1

Lista portas abertas de forma forçada

 $ nmap -Pn 127.0.0.1