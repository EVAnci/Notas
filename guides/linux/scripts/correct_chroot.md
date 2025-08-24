# 1. Montar la raíz si no está montada
mount /dev/sda2 /mnt

# 2. Crear y montar /boot/efi si no existe
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

# 3. Montar pseudo-FS necesarios
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc
mount --bind /sys /mnt/sys
mount --bind /run /mnt/run
mount -t efivarfs efivarfs /mnt/sys/firmware/efi/efivars

# 4. Entrar al chroot
chroot /mnt /bin/bash

# 5. Montar /dev/pts para apt
mount --bind /dev/pts /dev/pts

# 6. Forzar reinstalación del kernel
apt update
apt install --reinstall linux-image-6.12.38+deb13-amd64

# 7. Generar initramfs manualmente (por si no lo hizo automáticamente)
update-initramfs -c -k 6.12.38+deb13-amd64

# 8. Regenerar configuración de GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# 9. (Opcional) Reinstalar GRUB EFI en la NVRAM
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=debian

# 10. Salir del chroot
exit

# 11. Desmontar todo
umount -R /mnt

# 12. Reiniciar
reboot
