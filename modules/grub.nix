{pkgs, ...}:

  let
    sekiroTheme = pkgs.callPackage ../packages/sekiro-theme-grub.nix {};
  in
  {
    boot.loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";  # для UEFI
      splashImage = "${sekiroTheme}/themes/sekiro/sekiro_1920x1080.png";
      theme = "${sekiroTheme}/themes/sekiro";
      gfxmodeEfi = "1920x1080";
    };
    boot.loader.efi.canTouchEfiVariables = true;

  }
