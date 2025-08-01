{ config, lib, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.catppuccin-sddm
  ];
  services.displayManager.sddm = lib.mkIf config.hyprland.enable {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin";
  };
}


