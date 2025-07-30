{ config, lib, pkgs, gnomeEnabled ? false, hyprlandEnabled ? false, ... }:

{
  imports = [
    ./modules/wms/hyprland.nix
    ./modules/wms/gnome.nix
    ./modules/bundle.nix
  ];

  gnome.enable = gnomeEnabled;
  hyprland.enable = hyprlandEnabled;

  home.username = "roninn";
  home.homeDirectory = "/home/roninn";
  home.stateVersion = "25.05";
  
  systemd.user.startServices = true;
  programs.zsh.enable = true;
  programs.git.enable = true;


}
