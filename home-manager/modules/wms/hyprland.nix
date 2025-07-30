{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings = {
        bind = [
          "SUPER, RETURN, exec, alacritty"
        ];
      };
    };
  };
}
