# pve-vma-buster
Proxmox vma archive binary and some other usefull tools included docker image based on debian buster.

Inspired from [ganehag's repo](https://github.com/ganehag/pve-vma-docker).

Tools to extract, decrompress and convert vma archive.

- zstd, lzo, gzip, vma, qemu-utils


# Example Usage

You can convert vma archive disk to raw image and convert it to vmdk
```
mkdir /dump
mv vzdump-qemu.vma.zst /dump/
docker run --rm -v /dump:/backup seljuke/pve-vma-buster:latest bash -c "zstd -d vzdump-qemu.vma.zst; \
vma extract -v vzdump-qemu.vma extracted; \
qemu-img convert -pO vmdk extracted/disk-drive-scsi0.raw disk-drive-scsi0.vmdk"
```
now you can use `/dump/disk-drive-scsi0.vmdk` disk for importing proxmox vm to virtualbox or vmware.

If the vma archive compressed with lzop use `lzop -d` to decrompress.
