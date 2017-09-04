#!/bin/bash
set -e
cd /tmp/output

echo Preparing data...
rm -rf archive
mkdir archive
cd archive
for package in python3.5 python3.5-minimal libpython3.5 libpython3.5-minimal libpython3.5-stdlib python3-six ; do
	for path in $(dpkg -L $package) ; do
		if [ -f "$path" ] ; then
			cp --parents "$path" .
		fi
	done
done

mkdir -p usr/lib/python3/dist-packages/
cp /tmp/output/bin/bpy.so usr/lib/python3/dist-packages/bpy.so
cp -R /tmp/output/bin/2.78 usr/lib/python3/dist-packages/
cp -R /tmp/google usr/lib/python3/dist-packages/
cp /tmp/lib/python-launcher usr/bin/

libs=""
for lib in $(ldd /tmp/output/bin/bpy.so | cut -d'>' -f2 | awk '{print $1}') ; do
	if [ -f "$lib" ] ; then
		libs="$libs $lib"
	fi
done
dpkg -S $libs | egrep -v '^(libc6|libpython|libglib)' | while read package ; do
	package=$(echo $package | sed -e 's/:.*//')
	for path in $(dpkg -L $package) ; do
		if [ -f "$path" ] ; then
			cp --parents "$path" .
		fi
	done
done

echo Archiving data...
tar czf ../blender_python.tar.gz *
echo Archive successfully prepared.
