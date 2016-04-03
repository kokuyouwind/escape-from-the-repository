#!/bin/sh
cd `dirname $0`
cat key | tr -d '\n' > key2; mv key2 key
file=$(md5sum key | cut -c 1)
openssl aes-256-cbc -d -in data/$file -pass file:key -md md5 2>/dev/null
