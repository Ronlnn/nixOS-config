{ config, lib, pkgs, ... }:

{

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings = {
        bind = [
          "SUPER,RETURN,exec,alacritty"
        ];
      };
    };
}
