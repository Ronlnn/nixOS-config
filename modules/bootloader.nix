{
   # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.timeout = 3;
 boot.loader.grub = {
  enable = true;
  version = 2;
  efiSupport = true;
  device = "nodev";  # для UEFI
  splashImage = ../walls/zenitsu.png;
  };
  boot.loader.efi.canTouchEfiVariables = true;

}
