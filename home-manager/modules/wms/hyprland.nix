{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings = {
        # Горячая клавиша: SUPER + RETURN запускает alacritty
        bind = [
          "SUPER, RETURN, exec, alacritty"
        ];
      };
    };
  };
}
