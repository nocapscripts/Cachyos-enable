#!/bin/bash
set -e

echo "==> Cleaning up old files..."
rm -rf cachyos-repo cachyos-repo.sh cachyos-repo.tar.xz

echo "==> Downloading CachyOS repo installer..."
curl -O https://mirror.cachyos.org/cachyos-repo.tar.xz

echo "==> Extracting..."
tar xvf cachyos-repo.tar.xz && cd cachyos-repo

echo "==> Running CachyOS repo installer..."
sudo ./cachyos-repo.sh

echo "==> Done! CachyOS repos added."
