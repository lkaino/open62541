#!/bin/sh

rm -rf .build_virtual
mkdir .build_virtual
cd .build_virtual

. /opt/unicvm/1.0/environment-setup-core2-unicvm-linux
unset PYTHONHOME
mkdir python
ln -s /usr/bin/python python/python
export PATH=python:$PATH
/opt/devbox-cmake/3.13/bin/cmake .. -DCMAKE_BUILD_TYPE=Release -DUA_ARCHITECTURE=xenomai -DUA_ENABLE_AMALGAMATION=ON -DUA_ENABLE_ENCRYPTION=ON -DMBEDTLS_INCLUDE_DIRS=/media/projects/opcua_poc/mbedtls-2.14.0/.build_virtual/include/ -DMBEDTLS_LIBRARY=/media/projects/opcua_poc/mbedtls-2.14.0/.build_virtual/library/libmbedtls.a -DMBEDX509_LIBRARY=/media/projects/opcua_poc/mbedtls-2.14.0/.build_virtual/library/libmbedx509.a -DMBEDCRYPTO_LIBRARY=/media/projects/opcua_poc/mbedtls-2.14.0/.build_virtual/library/libmbedcrypto.a