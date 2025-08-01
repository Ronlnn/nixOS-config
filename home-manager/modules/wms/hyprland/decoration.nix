{config, lib, pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 0;
    active_opacity = 1.0;
    inactive_opacity = 1.0;
    fullscreen_opacity = 1.0;
    dim_inactive = true;
    dim_strength = 0.5;
    dim_special = 0.2;
    dim_around = 0.2;
    screen_shader = "";
    border_part_of_window = true;
  };
}