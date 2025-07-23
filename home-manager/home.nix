{ config, pkgs, ... }:

{
  imports = [
    ./modules/wms/hyprland.nix
  ];
  home.username = "roninn";
  home.homeDirectory = "/home/roninn";
  home.stateVersion = "25.05";

  programs.zsh.enable = true;
  programs.git.enable = true;
}
