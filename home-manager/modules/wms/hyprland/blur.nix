{config, lib, pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.blur = {
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
}