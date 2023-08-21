#!/bin/bash
if [ $# -lt 1 ]
then
    echo "Please provide the database ip address"
    exit 1
fi
cd scripts/dana/
dana DCScheme.o -ip $1