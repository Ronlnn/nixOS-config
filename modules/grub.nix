{pkgs, ...}:

  let
    sekiroTheme = pkgs.callPackage ../packages/sekiro-theme-grub.nix {};
  in
  {
    boot.loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";

      theme =  "${sekiroTheme}/grub/themes/sekiro";
      gfxmodeEfi = "1920x1080";

      font = "${sekiroTheme}/grub/themes/sekiro/dersu_uzala_brush_16.pf2";
      #splashImage = "${sekiroTheme}/themes/sekiro/background.png";

    };
    boot.loader.efi.canTouchEfiVariables = true;

  }
