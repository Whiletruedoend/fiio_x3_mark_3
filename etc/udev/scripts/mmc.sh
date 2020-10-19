#!/bin/sh

if [ "$ACTION" == "add" ]
then
	echo add > /tmp/mmc_add
    /bin/mount -t vfat -o iocharset=utf8,shortname=mixed /dev/$1 /mnt/mmc
	if [ "$?" != "0" ]
	then
	/bin/mount -o iocharset=utf8 /dev/$1 /mnt/mmc
	fi
	
	if [ "$?" != "0" ]
	then
		ntfs-3g /dev/$1 /mnt/mmc
	fi
elif [ "$ACTION" == "remove" ]
then
    rm /tmp/mmc_add -f
    /bin/umount /mnt/mmc
fi
