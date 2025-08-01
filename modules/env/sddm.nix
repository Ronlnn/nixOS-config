{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    environment.systemPackages = with pkgs; [
    pkgs.sddm-astronaut
  ];
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "astronaut"; # <-- это имя папки темы
    };
  };
}
