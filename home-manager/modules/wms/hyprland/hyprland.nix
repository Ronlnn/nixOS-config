{ config, lib, pkgs, ... }:

{
    imports = [
      ./general.nix
      ./decoration.nix
      ./monitors.nix
      ./blur.nix
      ./shadow.nix
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings = {

        "$mod" = "SUPER";
        bind = [
          "$mod, RETURN, exec, alacritty"
          "$mod, F, exec, firefox"
        ];
      };
    };
}
