{config, lib, pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 0;
    active_opacity = 1.0;
    inactive_opacity = 1.0;
    fullscreen_opacity = 1.0;
    dim_inactive = true;
    dim_strength = 0.2;
    dim_special = 0.2;
    dim_around = 0.2;
    screen_shader = "";
    border_part_of_window = true;
  };
  blur = {
    enable = true;
    size = 8;
    passes = 1;
    ignore_opacity = true;
    new_optimizations = true;
    xray = true;
    noise = 0.0117;
    contrast = 0.8916;
    brightness = 0.8172;
    vibrancy_darkness = 0.0;
    special = false;
    popups = false;
    input_methods = false;
  };
  shadow = {
    enable = true;
    range = 4;
    render_power = 3;
    sharp = false;
    ignore_window = true;
    color = "0xDB355E";
    scale = 1.0;
  };
}