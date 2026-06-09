echo "==> Updating system..." && sudo pacman -Syu --noconfirm && \
echo "==> Installing CachyOS LTS kernel..." && sudo pacman -S --noconfirm linux-cachyos-lts linux-cachyos-lts-headers && \
echo "==> Removing vanilla LTS kernel..." && sudo pacman -Rns --noconfirm linux-lts linux-lts-headers && \
echo "==> Regenerating GRUB config..." && sudo grub-mkconfig -o /boot/grub/grub.cfg && \
echo "==> All done! Rebooting in 5 seconds..." && sleep 5 && sudo reboot
