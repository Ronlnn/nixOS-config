{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/wms/hyprland.nix
    ./modules/wms/gnome.nix
    ./modules/bundle.nix
  ];


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
