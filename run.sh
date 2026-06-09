#!/bin/bash
set -e

echo ""
echo "==============================="
echo " CachyOS Enabler Linux Setup Tool"
echo "==============================="
echo ""
echo "  1) Enable CachyOS repositories (RUN FIRST)"
echo "  2) Install CachyOS LTS kernel"
echo "  3) Remove vanilla LTS kernel"
echo "  4) Rebuild GRUB config"
echo "  5) Run all (1-4)"
echo "  0) Exit"
echo ""
read -rp "==> Choose an option: " choice

case $choice in
  1)
    echo "==> Enabling CachyOS repositories (RUN FIRST)"
    sudo bash ./enable-cachyrepo.sh
    echo "==> Done!"
    ;;
  2)
    echo "==> Installing CachyOS LTS kernel..."
    sudo pacman -S --noconfirm linux-cachyos-lts linux-cachyos-lts-headers
    echo "==> Done!"
    ;;
  3)
    echo "==> Removing vanilla LTS kernel..."
    sudo pacman -Rns --noconfirm linux-lts linux-lts-headers
    echo "==> Done!"
    ;;
  4)
    echo "==> Rebuilding GRUB config..."
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    echo "==> Done!"
    ;;
  5)
    echo "==> Running full setup..."
    sudo bash ./enable-cachyrepo.sh
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm linux-cachyos-lts linux-cachyos-lts-headers
    sudo pacman -Rns --noconfirm linux-lts linux-lts-headers
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    echo ""
    echo "==> All done! Rebooting in 5 seconds..."
    sleep 5
    sudo reboot
    ;;
  0)
    echo "Bye!"
    exit 0
    ;;
  *)
    echo "==> Invalid option."
    exit 1
    ;;
esac
