#!/bin/bash
host=$1
user=$2
password=$3
prePASSCODE=$4
file=$HOME"/.ssh/master-$user@$host:22"
if [ -e "$file" ]; then
    ssh $user@$host
else
    ./auto_login.exp $host $user $password $prePASSCODE
fi
