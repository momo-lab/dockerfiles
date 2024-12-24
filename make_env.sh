#! /usr/bin/env bash
root=$(cd $(dirname $0) | pwd) 
env_file=$root/.env
echo "USERNAME=$(id -un)" > $env_file
echo "GROUPNAME=$(id -gn)" >> $env_file
echo "HOST_UID=$(id -u)" >> $env_file
echo "HOST_GID=$(id -g)" >> $env_file

echo Create file [$env_file] with this contents.
cat $env_file
