FROM debian:buster

WORKDIR /tmp

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y zstd lzop wget gnupg2 && \
  echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list && \
  wget -O- "http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg" | apt-key add - && \
  apt-get update && \
  apt-get install -y pve-qemu-kvm && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /backup
