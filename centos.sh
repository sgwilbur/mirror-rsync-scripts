#!/bin/sh

rsync="/usr/local/bin/rsync -avqHz --delete --delay-updates" # --bwlimit=256"
mirror=msync.centos.org::CentOS

ver=5
archlist="i386 x86_64"
baselist="os updates"
local=/var/www/u1/pub/CentOS

for arch in $archlist
do
  for base in $baselist
  do
    remote=$mirror/$ver/$base/$arch/
    echo " Running command: $rsync $remote $local/$ver/$base/$arch/ "
    $rsync $remote $local/$ver/$base/$arch/
  done
done

