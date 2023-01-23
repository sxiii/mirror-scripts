#!/bin/bash
hostname=$(hostname)
ExampleDebPackages=("https://ubuntu.hi.no/archive/pool/main/h/htop/htop_3.2.1-1_amd64.deb" \
                    "https://ubuntu.hi.no/archive/pool/main/m/mtr/mtr-tiny_0.95-1_amd64.deb")
ExampleArchPackages=("https://europe.mirror.pkgbuild.com/extra/os/x86_64/htop-3.2.1-1-x86_64.pkg.tar.zst" \
                     "https://asia.mirror.pkgbuild.com/extra/os/x86_64/mtr-0.95-3-x86_64.pkg.tar.zst")
ExampleRpmPackages=("https://repo.almalinux.org/almalinux/9/BaseOS/x86_64/os/Packages/mtr-0.94-4.el9.x86_64.rpm" \
                    "https://repo.almalinux.org/almalinux/9/extras/x86_64/os/Packages/epel-release-9-2.el9.noarch.rpm")

download () {
  echo "Download from: $i"
  filename=$(echo $i | cut -d"/" -f 4-)
  dirname=$(dirname $i | cut -d"/" -f 4-)
  mkdir -p /srv/http/$system/$dirname && cd /srv/http/$system/$dirname && wget -q $i
  echo "Serve as: https://$hostname/$system/$filename"
}

echo "Making a Debian / Ubuntu repository from ExampleDebPackages"
system="ubuntu"
for i in ${ExampleDebPackages[@]}; do
download
done

echo "Making a Arch repository from ExampleArchPackages"
system="arch"
for i in ${ExampleArchPackages[@]}; do
download
done

echo "Making a Alma Linux repository from ExampleRpmPackages"
system="alma"
for i in ${ExampleRpmPackages[@]}; do
download
done

echo "Repofiles are downloaded, you can now start your webserver"
