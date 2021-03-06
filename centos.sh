#!/bin/sh

rsync="/usr/local/bin/rsync -avqHz --delete --delay-updates" # --bwlimit=256"
mirror=msync.centos.org::CentOS

versionlist="5 5.6"
archlist="i386 x86_64"
baselist="os updates"
local=/var/www/u1/pub/CentOS

for ver in $versionlist
  do
  for arch in $archlist
    do
    for base in $baselist
      do
      remote=$mirror/$ver/$base/$arch/
      echo " Running command: $rsync $remote $local/$ver/$base/$arch/ "

      if [ ! -d $local/$ver/$base/$arch/ ]
      then
	echo "Local directory does not exist yet, creating."
        mkdir -p $local/$ver/$base/$arch/
      fi

      $rsync $remote $local/$ver/$base/$arch/
    done
  done
done

