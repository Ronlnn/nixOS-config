{ config, lib, pkgs, ... }:
let
  sddmAstronautTheme = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "3ef9f511fd072ff3dbb6eb3c1c499a71f338967e";
    sha256 = "sha256-33CzZ4vK1dicVzICbudk8gSRC/MExG+WnrE9wIWET14=";
  };
in {

  environment.etc."sddm/themes/astronaut".source = sddmAstronautTheme;

  services.displayManager.sddm = lib.mkIf config.hyprland.enable {
    enable = true;
    wayland.enable = true;
    theme = "astronaut";
  };
}


