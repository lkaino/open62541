#!/bin/sh

rm -rf .build_hw
mkdir .build_hw
cd .build_hw

. /opt/unic2/1.3/environment-setup-ppce300c3-unic2-linux-uclibc
unset PYTHONHOME
mkdir python
ln -s /usr/bin/python python/python
export PATH=python:$PATH
/opt/devbox-cmake/3.13/bin/cmake .. -DCMAKE_BUILD_TYPE=Release -DUA_ARCHITECTURE=xenomai -DUA_ENABLE_AMALGAMATION=ON -DUA_ENABLE_ENCRYPTION=ON -DMBEDTLS_INCLUDE_DIRS=/media/projects/opcua_poc/mbedtls-2.14.0/.build_hw/include/ -DMBEDTLS_LIBRARY=/media/projects/opcua_poc/mbedtls-2.14.0/.build_hw/library/libmbedtls.a -DMBEDX509_LIBRARY=/media/projects/opcua_poc/mbedtls-2.14.0/.build_hw/library/libmbedx509.a -DMBEDCRYPTO_LIBRARY=/media/projects/opcua_poc/mbedtls-2.14.0/.build_hw/library/libmbedcrypto.a
make -j