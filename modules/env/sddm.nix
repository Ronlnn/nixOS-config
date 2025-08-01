{ config, lib, pkgs, ... }:

{
  environment.systemPackages = lib.mkIf config.hyprland.enable (with pkgs; [
    sddm-astronaut
  ]);

  services.displayManager.sddm = lib.mkIf config.hyprland.enable {
    enable = true;
    wayland.enable = true;
    theme = "${pkgs.sddm-astronaut}/share/sddm/themes/astronaut";
  };
}
