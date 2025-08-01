{ config, lib, pkgs, ... }:

{

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings = {
        bind = [
          "SUPER,RETURN,exec,/etc/profiles/per-user/roninn/bin/alacritty"
        ];
      };
    };
}
