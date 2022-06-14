---
extends: _layouts.post
section: content
title: 200.1 Notes
date: 2021-06-10
description: 200.1 Notes
cover_image: /assets/img/post-cover-image-2.png
published: false
---

## Top Command

## us, user    

time running un-niced user processes

## sy, system  

time running kernel processes

## ni, nice    

time running niced user processes

## id, idle    

time spent in the kernel idle handler

## wa, IO-wait 

time waiting for I/O completion

## hi 

time spent servicing hardware interrupts

## si 

time spent servicing software interrupts

## st 

time stolen from this vm by the hypervisor


# nfsiostat

O que é isso? Vi essa pergunta na udemy

"Which commands below are useful to collect data about remote filesystem connections? (Choose TWO correct answers.)"

Resposta: **nfsiostat**


# kernel

On a server running the 3.4.50-11 Linux kernel, o arquivo de configuração na pasta /boot se chama config-3.4.50-11

O archive format usado para criar o initramfs é o **cpio**

## modules.dep 

É uma lista de todos os modulos compialdos e suas dependencias

#collectd

zImage é carregada totalmente carregada em low memory. bzImage é carregado em high memory se o low memory esta cheio

Passos para copiar o initramfs

    cp /boot/initramfs    
    cp /boot/initramfs /tmp/initramfs.gz
    gunzip /tmp/initramfs.gz
    mkdir /tmp/initramfs.dir
    cd /tmp/initramfs.dir
    cpio -i < /tmp/initramfs


## udevadm

Escuta por eventos no kernel, produzidas por uma regra udev e envia as informações por console




O sistema de arquivos raiz é montado em modo de apenas leitura para que uma checagem de disco possa ser feita sem risco de danificar o sistema de arquivos


## autofs


## RAID

