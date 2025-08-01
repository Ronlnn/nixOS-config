{ config, lib, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.monitors = [
          {
            name = "eDP-1";
            primary = true;
            scale = 1.5;
            transform = "normal";
            position = {x = 0; y = 0;};
          }
          {
            name = "HDMI-2";
            primary = false;
            scale = 1.5;
            transform = "normal";
            position = {x = 0; y = 0;};
          }
        ];
}