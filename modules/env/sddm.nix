{ config, lib, pkgs, ... }:

let
  astronautTheme = import ../../packages/astronaut-sddm-theme.nix { inherit pkgs; };
in
{
  config = lib.mkIf config.hyprland.enable {
    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "astronaut";  # <-- имя темы, не путь
        package = astronautTheme;  # <-- путь к derivation
      };
    };
  };
}
