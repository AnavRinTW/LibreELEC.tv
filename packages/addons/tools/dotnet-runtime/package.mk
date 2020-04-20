# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

case "$ARCH" in
  "aarch64")
    PKG_NC_ARCH="arm64"
    PKG_SHA256="72fbe81a7fb789914be83c0f70c22826137d30183984bc22974b8fc1e1876b5a"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/aec14e02-5c01-4447-b3f4-fa205b7c0603/7beea31e0c9faa20f5d692537cde54a5/dotnet-runtime-3.1.3-linux-arm64.tar.gz"
    ;;
  "arm")
    PKG_NC_ARCH="arm"
    PKG_SHA256="2c7cd1ced5d2c5aa2b63d2980cba0d62f8bb07ce9ae18e692cfc3c8c5989bef9"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/c11e9248-404f-4e5b-bd99-175079419d6f/83902a43e06f9fb4e45a4c6a6d5afc0b/dotnet-runtime-3.1.3-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_NC_ARCH="x64"
    PKG_SHA256="776d8573f37d89ee8ba9ac09d83b31656eb4c8ca9cb3a7829ce865d040b49c3d"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/1229b766-b66b-478e-b49d-59c46e21cad9/0e9a1cf3c56ef85c8fff20abc6db780c/dotnet-runtime-3.1.3-linux-musl-x64.tar.gz"
    ;;
esac

PKG_NAME="dotnet-runtime"
PKG_VERSION="3.1.3"
PKG_REV="108"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.github.io/"
PKG_DEPENDS_TARGET="toolchain curl curl3 krb5 lttng-ust"
PKG_SECTION="tools"
PKG_SHORTDESC=".NET Core Runtime"
PKG_LONGDESC=".NET Core Runtime ($PKG_VERSION) runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME=".Net Core Runtime"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_MAINTAINER="Anton Voyl (awiouy)"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp -r $PKG_BUILD/* \
        $ADDON_BUILD/$PKG_ADDON_ID/bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/libs
  cp -L $(get_install_dir curl3)/usr/lib/libcurl.so.? \
        $(get_install_dir krb5)/usr/lib/libcom_err.so.? \
        $(get_install_dir krb5)/usr/lib/libgssapi_krb5.so.? \
        $(get_install_dir krb5)/usr/lib/libk5crypto.so.? \
        $(get_install_dir krb5)/usr/lib/libkrb5.so.? \
        $(get_install_dir krb5)/usr/lib/libkrb5support.so.? \
        $(get_install_dir lttng-ust)/usr/lib/liblttng-ust.so.? \
        $(get_install_dir lttng-ust)/usr/lib/liblttng-ust-tracepoint.so.? \
        $ADDON_BUILD/$PKG_ADDON_ID/libs
}
