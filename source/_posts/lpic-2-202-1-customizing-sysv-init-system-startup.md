---
extends: _layouts.post
section: content
title: 202.1 Customizing SysV-init system startup
date: 2021-10-22
description: 202.1 Customizing SysV-init system startup
cover_image: /assets/img/post-cover-image-2.png
published: true
---


Niveis de execução que vão de 0 á 6

* 0 é o `halt` para desligar a maquina
* 1 é o single user
* 2 - 5 é o multiuser
* 6 é o reboot 

## Systemd


## SysV init

O arquivo de configuração do init é o `/etc/inittab`. E é nele que é definido o run level padão do sistemana seguinte linha

    # The default run level
    id:2:initdefault:


## Linux Standard Base Specification (LSB)

É um padrão para que todas as distribuições linux possam seguir. Esse padrão define:

* Conjunto de bibliotecas;
* conjunto de comandos;
* Conjunto de modulos;

Esse padrão ainda fornece um certificado para as distriuições que seguem esse padrão. O Debian e nem o red Hat seguem esse padrão, mas podem atender, basta instalar um pacote com o sistema de gerenciamento de pacotes.



## /usr/lib/systemd/

## /etc/systemd/


## /run/systemd/


## systemctl


## systemd-delta


## /etc/inittab

Esse é o arquivo de cofiguração do init

## /etc/init.d/
 
É nesse diretorio que ficam os scripts de inicialização de serviços do `sysV` ou `init`

    $ ls -lah
    -rwxr-xr-x 1 root root 2.3K Nov 22  2018 acpid
    -rwxr-xr-x 1 root root 5.3K Mar 30  2019 alsa-utils
    -rwxr-xr-x 1 root root 2.9K Jun  9 04:59 bluetooth
    -rwxr-xr-x 1 root root 1.9K Nov 17  2015 cgroupfs-mount
    -rwxr-xr-x 1 root root 3.0K Oct 11  2019 cron
    -rwxr-xr-x 1 root root  937 Aug 26  2019 cryptdisks
    -rwxr-xr-x 1 root root  896 Aug 26  2019 cryptdisks-early
    -rwxr-xr-x 1 root root 2.8K Apr  4  2021 cups
    -rwxr-xr-x 1 root root 2.8K Jul  5  2020 dbus
    -rwxr-xr-x 1 root root 3.8K Jun 19  2020 docker


## /etc/rc.d/

Dentro do /etc existem diretórios para cada runlevel, aqui estão eles:

     $ ls -ld /etc/rc*.d
    drwxr-xr-x 2 root root 4096 Oct 25 23:53 /etc/rc0.d
    drwxr-xr-x 2 root root 4096 Oct 25 23:53 /etc/rc1.d
    drwxr-xr-x 2 root root 4096 Oct 25 23:53 /etc/rc2.d
    drwxr-xr-x 2 root root 4096 Oct 25 23:53 /etc/rc3.d
    drwxr-xr-x 2 root root 4096 Oct 25 23:53 /etc/rc4.d
    drwxr-xr-x 2 root root 4096 Oct 25 23:53 /etc/rc5.d
    drwxr-xr-x 2 root root 4096 Oct 25 23:53 /etc/rc6.d
    drwxr-xr-x 2 root root 4096 Sep 29 00:08 /etc/rcS.d

O diretorio `/etc/rcS.d` é igual ao `/etc/rc1.d`. O `S` é de single. Esse runlevel serve para realizar manutenção no sistema.

Vamos entrar no runlevel 0 e listar os arquivos dele

    $ /etc/rc2.d/ ll
    total 4.0K
    lrwxrwxrwx 1 root root  16 Sep 29 00:08 K01gdomap -> ../init.d/gdomap
    lrwxrwxrwx 1 root root  17 Sep 29 00:08 K01openvpn -> ../init.d/openvpn
    lrwxrwxrwx 1 root root  16 Sep 29 00:08 K01xl2tpd -> ../init.d/xl2tpd
    lrwxrwxrwx 1 root root  15 Sep 29 00:08 K02ipsec -> ../init.d/ipsec
    lrwxrwxrwx 1 root root  21 Sep 29 00:06 S01laptop-mode -> ../init.d/laptop-mode


Dentro dele existem links quando um link começa com a letra `K` e que aquele processo vai ser eliminado naquele runlevel. Quando tem um `S` significa que ele vai ser iniciado nesse runlevel. 
O número que vem em seguida determina a ordem que que esses processos serão executados/eliminados. Como a maioria estão como `01` eles tem a mesma prioridade de execução.


## chkconfig


## update-rc.d

**No Debian** esse comando serve para alterar a execução de processos nos runlevels. Isso poderia ser feito alterando o links dentro do diretorio /etc/rc*.d. 

Vamos primeiramente exibir em quais runlevels o rsyslog é executado com o comando:

    λ ~/ ls -l /etc/rc*.d/*rsyslog*
    lrwxrwxrwx 1 root root 17 Sep 29 00:08 /etc/rc0.d/K03rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:08 /etc/rc1.d/K03rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:02 /etc/rc2.d/S01rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:02 /etc/rc3.d/S01rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:02 /etc/rc4.d/S01rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:02 /etc/rc5.d/S01rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:08 /etc/rc6.d/K03rsyslog -> ../init.d/rsyslog


Acima podemos ver qye ele é iniciado no runlevel5. Para desabilitar ele nesse run level executamos

    $ updaterc.d rsyslog disable 5

Vamos listar para verificar se a alteração foi realizada  epor fim vamos desafazer a alteração com o enable.


    $ ~/ ls -l /etc/rc*.d/*rsyslog*        
    lrwxrwxrwx 1 root root 17 Sep 29 00:08 /etc/rc0.d/K03rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:08 /etc/rc1.d/K03rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:02 /etc/rc2.d/S01rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:02 /etc/rc3.d/S01rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:02 /etc/rc4.d/S01rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Nov  1 23:40 /etc/rc5.d/K03rsyslog -> ../init.d/rsyslog
    lrwxrwxrwx 1 root root 17 Sep 29 00:08 /etc/rc6.d/K03rsyslog -> ../init.d/rsyslog
    $ ~/ sudo update-rc.d rsyslog enable 5 
    $ ~/ ls -l /etc/rc*.d/*rsyslog*        
    lrwxrwxrwx 1 root root 17 Sep 29 00:08 /etc/rc0.d/K03rsysl**No Debian** esse comando serve para alterar a execução de processos nos runlevels. Isso poderia ser feito alterando o links dentro do diretorio /etc/rc*.d. og -> ../init.d/rsyslog


Podemos ainda remover tudo com

    $ update-rc.d rsyslog remove

Podemos tambem restaurar as configuações padrão com o comando

    update-rc.d rsyslog defaults

O init sabe dessas configurações padrão porque no cabeçalho do script de inicialização existem essas informações como no exemplo abaixo


    #! /bin/sh
    ### BEGIN INIT INFO
    # Provides:          rsyslog
    # Required-Start:    $remote_fs $time
    # Required-Stop:     umountnfs $time
    # X-Stop-After:      sendsigs
    # Default-Start:     2 3 4 5
    # Default-Stop:      0 1 6
    # Short-Description: enhanced syslogd
    # Description:       Rsyslog is an enhanced multi-threaded syslogd.
    #                    It is quite compatible to stock sysklogd and can be 
    #                    used as a drop-in replacement.
    ### END INIT INFO

Esse é o cabeçalho na linha `Default-Start` podemos ver os runlevels padrão desse script.


Existe ainda o parametro `-n` que não executa de fato o script ele apenas testa.


Já no **centos** existe o comando chkconfig




## init and telinit

telinit serve para mudar o runlevel no SysV