#!/bin/sh
cd `dirname $0`

if [ ! `which openssl` ]; then
  echo "opensslコマンドが存在しませんのでインストールしてください."
  exit
fi

if [ ! `which md5sum` ]; then
  echo "md5sumコマンドが存在しませんのでインストールしてください."
  exit
fi

file=$(md5sum key | cut -c 1-10)
if [ ! -e $file ]; then
  echo "md5sumの出力が一致しません. 端末のエンコード設定などを確認してください."
  exit
fi

openssl aes-256-cbc -d -in $file -pass file:key -md md5 2>/dev/null
