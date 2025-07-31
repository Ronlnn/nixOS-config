{pkgs, ...}:
{
 boot.loader.grub = {
  enable = true;
  efiSupport = true;
  device = "nodev";  # для UEFI
  #splashImage = ../walls/zenitsu.png;
  theme = pkgs.catppuccin-grub;
  };
  boot.loader.efi.canTouchEfiVariables = true;

}
