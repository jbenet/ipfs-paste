#!/bin/sh

set -e
set -u

src=ipfs-paste
dst=/usr/local/bin/ipfs-paste

echo cp "$src" "$dst"
cp "$src" "$dst"
