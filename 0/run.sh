#!/bin/sh
cd `dirname $0`
openssl aes-256-cbc -d -in data -pass file:key -md md5 2>/dev/null
