{ config, lib, pkgs, ... }:

let
  astronautTheme = pkgs.callPackage ../../packages/astronaut-sddm-theme.nix {};
in
{
  config = lib.mkIf config.hyprland.enable {
    environment.systemPackages = [ astronautTheme ];
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "astronaut"; # <-- это имя папки темы
    };
  };
}
