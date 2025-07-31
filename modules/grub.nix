{pkgs, ...}:
{
 boot.loader.grub = {
  enable = true;
  efiSupport = true;
  device = "nodev";  # для UEFI
  #splashImage = ../walls/zenitsu.png;
  theme = "/boot/grub/themes/sekiro_grub_theme/theme.txt";
  };
  boot.loader.efi.canTouchEfiVariables = true;

}
