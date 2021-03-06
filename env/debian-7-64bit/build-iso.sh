#!/bin/bash -x

set -e

arch=amd64
suite=wheezy
chroot_dir="/var/chroot/$suite"
apt_mirror="http://archive.debian.org/debian/"

SCRIPT_DIR=$(cd `dirname "$0"`; pwd)
BASE_DIR=`dirname "$SCRIPT_DIR"`
BASE_DIR=`dirname "$BASE_DIR"`
CONFIG_FILE="$BASE_DIR/config.sh"
if [ -f $CONFIG_FILE ]; then
	source $CONFIG_FILE
fi

export DEBIAN_FRONTEND=noninteractive
setarch x86_64 debootstrap --arch $arch $suite $chroot_dir $apt_mirror

cat <<EOF > $chroot_dir/etc/apt/sources.list
deb $apt_mirror $suite main
#deb $apt_mirror $suite-updates main
#deb http://security.debian.org/ $suite/updates main
EOF

chroot $chroot_dir apt-get update
chroot $chroot_dir apt-get upgrade -y
chroot $chroot_dir apt-get autoclean
chroot $chroot_dir apt-get clean
chroot $chroot_dir apt-get autoremove

genisoimage -quiet -R -o "$SCRIPT_DIR/debian-$suite-$arch.iso" "$chroot_dir"

rm -rf $chroot_dir
