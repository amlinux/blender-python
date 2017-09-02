#!/bin/bash
set -e
bucket=$1
if [ -z "$bucket" ] ; then
	echo "Usage: $0 <gcloud-storage-bucket>"
	exit 1
fi
version=$(date '+%F-%H-%M-%S')
output=gs://$bucket/blender-python-${version}.tar.gz
gsutil cp output/blender_python.tar.gz $output
echo $output
