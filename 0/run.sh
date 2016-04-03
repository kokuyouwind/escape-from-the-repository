#!/bin/sh
cd `dirname $0`
openssl aes-256-cbc -d -in data -pass file:key
