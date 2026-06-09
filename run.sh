#!/bin/bash
set -e

echo "==> Enabling CachyOS repositories..."
chmod +x ./enable-cachyrepo.sh
sudo bash ./enable-cachyrepo.sh

echo "==> Done!"
