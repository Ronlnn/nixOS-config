{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings = {
        bind = [
          # bind
          "SUPER, RETURN, exec, alacritty"
        ];
      };
    };
  };
}
