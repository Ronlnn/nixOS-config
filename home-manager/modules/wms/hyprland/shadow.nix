{config, lib, pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.shadow = {
    enable = true;
    range = 4;
    render_power = 3;
    sharp = false;
    ignore_window = true;
    color = "0x#DB355E";
    scale = 1.0;
  };
}