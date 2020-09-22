#!/bin/sh

# Check if build directory exists and delete if so
if test -d build; then
	rm -r build
fi

# Build executable, copy install/uninstall scripts, rename and archive application files
python setup.py build
cp assets/scripts/install.sh build
cp assets/scripts/uninstall.sh build
cd build && mkdir hs-app
cd exe.linux-x86_64-3.6 && cp -r . ../hs-app
cd ../ && tar -czvf hs-app.tar.gz hs-app
rm -r exe.linux-x86_64-3.6
