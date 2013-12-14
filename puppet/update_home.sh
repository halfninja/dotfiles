#!/bin/bash

DIR=`dirname $0`

sudo puppet apply --modulepath "${DIR}/modules" "${DIR}/manifests/home.pp"
