{ config, lib, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.catppuccin-sddm
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin";
  };
}


