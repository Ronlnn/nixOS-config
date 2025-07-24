{ pkgs, ... }:

{
  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };
  boot.kernelModules = [ "tun" ];
    networking.networkmanager.enable = true;
}
