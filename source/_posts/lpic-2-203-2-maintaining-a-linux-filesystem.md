---
extends: _layouts.post
section: content
title: 203.2 Maintaining a Linux filesystem​
date: 2021-10-22
description: 203.2 Maintaining a Linux filesystem​
cover_image: /assets/img/post-cover-image-2.png
published: true
---

## Tools and utilities to manipulate and ext2, ext3 and ext4


## Tools and utilities to perform basic Btrfs operations, including subvolumes and snapshots


## Tools and utilities to manipulate XFS


## Awareness of ZFS

## mkfs (mkfs.*)


## mkswap

## fsck (fsck.*)

## tune2fs

## dumpe2fs

Exibe informações sobre uma determinada partição

    $ dumpe2fs /dev/sda1
    dumpe2fs 1.44.5 (15-Dec-2018)
    Filesystem volume name:   Boot
    Last mounted on:          /boot
    Filesystem UUID:          3602b82e-7fc9-4f25-a3ef-d4c206e7479b
    Filesystem magic number:  0xEF53
    Filesystem revision #:    1 (dynamic)
    Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
    Filesystem flags:         signed_directory_hash 
    Default mount options:    user_xattr acl
    Filesystem state:         clean
    Errors behavior:          Continue
    Filesystem OS type:       Linux
    Inode count:              98304
    Block count:              393216
    Reserved block count:     19660
    Free blocks:              335378
    Free inodes:              97852


## debugfs

## btrfs, btrfs-convert


## xfs_info, xfs_check, xfs_repair, xfsdump and xfsrestore


## smartd, smartctl