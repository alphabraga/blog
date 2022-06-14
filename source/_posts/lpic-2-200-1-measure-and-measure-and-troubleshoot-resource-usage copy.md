---
extends: _layouts.post
section: content
title: 200.1 Measure and Troubleshoot Resource Usage
date: 2021-10-22
description: 203.1 Measure and Troubleshoot Resource Usage
cover_image: /assets/img/post-cover-image-2.png
published: true
---

## Measure CPU usage


## Measure memory usage


## Measure disk I/O


## Measure network I/O


## Measure firewalling and routing throughput


## Map client bandwidth usage


## Match / correlate system symptoms with likely problems


## Estimate throughput and identify bottlenecks in a system including networking


## iostat

## netstat

## w


## top


## sar


## processes blocked on I/O


## blocks out


## vmstat

Exibe informaçõs sobre processos, memoria, paginação, block IO, disco e atividade de CPU

    vmstat <delay> <repetições>    

    vmstat 2                           
    procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
    r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
    1  0 571136 1108860 1113588 8319352    0    0    14    22    1    3  1  1 98  0  0
    0  1 571136 1125264 1113696 8317868    0    0     0   868 1938 6617  4  2 94  0  0
    0  0 571136 1127784 1113844 8313972    0    0     0   642 1323 4547  2  1 97  0  0
    1  0 571136 1124760 1114016 8311144    0    0     0   792 1382 4764  2  1 97  0  0
    1  0 571136 1145364 1114260 8301892    0    0     2  7350 1566 5180  4  1 95  0  0
    0  0 571136 1162500 1114472 8290384    0    0    10  5944 1423 4845  3  1 96  0  0
    2  0 571136 1160232 1114612 8291476    0    0     0   586 1119 3626  2  0 98  0  0
    0  0 571136 1148940 1114728 8290512    0    0     0   308 1157 3413  2  1 98  0  0
    1  0 571136 1147844 1114856 8290764    0    0     0   700 1112 3754  2  1 97  0  0



## pstree, ps


## Isof


## uptime


## swap


## blocks in
