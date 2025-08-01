{ config, lib, pkgs, ... }:

let
  astronautTheme = import ../../packages/astronaut-sddm-theme.nix { inherit pkgs; };
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
