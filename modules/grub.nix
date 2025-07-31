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

      font = if builtins.pathExists "${sekiroTheme}/grub/themes/sekiro/dersu_uzala_brush_16.pf2"
           then "${sekiroTheme}/grub/themes/sekiro/dersu_uzala_brush_16.pf2"
           else null;
      #splashImage = "${sekiroTheme}/themes/sekiro/background.png";

    };
    boot.loader.efi.canTouchEfiVariables = true;

  }
