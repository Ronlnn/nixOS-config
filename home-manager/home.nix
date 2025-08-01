{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/wms/hyprland.nix
    ./modules/wms/gnome.nix
    ./modules/bundle.nix
  ];

  config.gnome.enable = true;
  config.hyprland.enable = true;
  home.username = "roninn";
  home.homeDirectory = "/home/roninn";
  home.stateVersion = "25.05";

  systemd.user.startServices = true;


  programs.bash = {
    enable = true;
    shellAliases = {
      nix-backup = "/home/roninn/nix-backup.sh";
    };
  };

}
