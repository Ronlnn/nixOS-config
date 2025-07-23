{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, Return, exec, alacritty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, D, exec, wofi --show drun"
        "$mod SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"
      ];

      exec-once = [
        "waybar"
        "swww-daemon && swww img ~/Pictures/wallpapers/default.jpg"
        "mako"
      ];

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };
    };
  };
}
