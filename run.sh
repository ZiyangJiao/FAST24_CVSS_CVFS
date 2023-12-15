#! /bin/bash
sudo rm -rf *.o
sudo rm -rf *.ko
sudo rm -rf .*.cmd

sudo make CONFIG_F2FS_FS=m -C/lib/modules/5.15.0-76-generic/build M=/home/femu/linux-5.15.0-76-generic-f2fs/ modules
sudo umount /dev/nvme0n1
sudo rmmod f2fs
sudo modprobe zstd_compress && sudo modprobe lz4hc_compress && sudo modprobe lz4_compress && sudo insmod /home/femu/linux-5.15.0-76-generic-f2fs/f2fs.ko
