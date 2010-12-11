#!/bin/sh
trap "rm -f /tmp/kexec_loaded ; exit 2" SIGINT SIGTERM

if [ -e /tmp/kexec_loaded ] ; then
    exit 1
else
    touch /tmp/kexec_loaded
fi

sleep 60 &&
$(mount /dev/sda1 /mnt/
kexec -l /mnt/boot/vmlinuz --append="block2mtd.block2mtd=/dev/sda3,65536,rootfs root=/dev/mtdblock0 rootfstype=squashfs rootwait console=tty0 console=ttyS0,38400n8 noinitrd reboot=bios"
umount /dev/sda1
kexec -e)