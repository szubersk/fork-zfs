#!/bin/sh

[ "${V-}" != 1 ] || set -x

os_type() {
  local ID=unknown
  [ -r /etc/os-release ] && echo "$ID"
}

main() {
  case $(os_type) in 
    fedora)
      dnf install -y gcc make autoconf automake libtool rpm-build libtirpc-devel libblkid-devel libuuid-devel libudev-devel openssl-devel zlib-devel libaio-devel libattr-devel elfutils-libelf-devel kernel-devel python3 python3-devel python3-setuptools python3-cffi libffi-devel git ncompress libcurl-devel dkms \
        clang llvm libasan libubsan \
        vim git bash-completion ca-certificates
      ;;
    *)
      echo "Unknown OS type" >&2
      exit 1
      ;;
  esac
}

main "$@"
