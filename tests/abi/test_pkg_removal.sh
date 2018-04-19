#!/bin/bash
#
# Ideally we would test here against an ABI database and ensure nothing
# is removed/changed in a way to break the core. As a simpler approximation
# of this we just check here that no packages got changed since we last
# run this.
#

set -e

if [ "$(dpkg --print-architecture)" != "amd64" ]; then
    echo "only testing on amd64 for now"
    exit 0
fi

diff -u \
     <(tail -n +6 prime/usr/share/snappy/dpkg.list|awk '{print $2}'|sort) \
     <(cat <<EOF
adduser
apt
base-files
base-passwd
bash
bsdutils
bzip2
coreutils
dash
debconf
debianutils
diffutils
distro-info-data
dpkg
e2fsprogs
fdisk
findutils
gcc-8-base:amd64
gpgv
grep
gzip
hostname
init-system-helpers
libacl1:amd64
libapparmor1:amd64
libapt-pkg5.0:amd64
libargon2-0:amd64
libattr1:amd64
libaudit1:amd64
libaudit-common
libblkid1:amd64
libbz2-1.0:amd64
libc6:amd64
libcap2:amd64
libcap-ng0:amd64
libc-bin
libcom-err2:amd64
libcryptsetup12:amd64
libdb5.3:amd64
libdebconfclient0:amd64
libdevmapper1.02.1:amd64
libext2fs2:amd64
libfdisk1:amd64
libffi6:amd64
libgcc1:amd64
libgcrypt20:amd64
libgmp10:amd64
libgnutls30:amd64
libgpg-error0:amd64
libhogweed4:amd64
libidn11:amd64
libidn2-0:amd64
libip4tc0:amd64
libjson-c3:amd64
libkmod2:amd64
liblz4-1:amd64
liblzma5:amd64
libmount1:amd64
libncurses5:amd64
libncursesw5:amd64
libnettle6:amd64
libnss-extrausers
libp11-kit0:amd64
libpam0g:amd64
libpam-modules:amd64
libpam-modules-bin
libpam-runtime
libpcre3:amd64
libprocps6:amd64
libseccomp2:amd64
libselinux1:amd64
libsemanage1:amd64
libsemanage-common
libsepol1:amd64
libsmartcols1:amd64
libss2:amd64
libstdc++6:amd64
libsystemd0:amd64
libtasn1-6:amd64
libtinfo5:amd64
libudev1:amd64
libunistring2:amd64
libuuid1:amd64
libzstd1:amd64
login
lsb-base
mawk
mount
ncurses-base
ncurses-bin
passwd
perl-base
procps
sed
sensible-utils
systemd
sysvinit-utils
tar
tzdata
ubuntu-keyring
util-linux
zlib1g:amd64
EOF
     )
