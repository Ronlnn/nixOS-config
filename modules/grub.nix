{pkgs, ...}:

  let
    sekiroTheme = import ../packages/sekiro-theme-grub.nix{
      inherit (pkgs) stdenv fetchFromGitHub;
    };
  in
{
  boot.loader.grub = {
  enable = true;
  efiSupport = true;
  #device = "nodev";  # для UEFI
  #splashImage = ../walls/zenitsu.png;
  theme = "${sekiroTheme}/theme.txt";
  };
  boot.loader.efi.canTouchEfiVariables = true;

}
