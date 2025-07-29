{ config, pkgs, ... }:

{
  imports = [
    ./modules/wms/hyprland.nix
    #./modules/bundle.nix
  ];
  home.username = "roninn";
  home.homeDirectory = "/home/roninn";
  home.stateVersion = "25.05";
  systemd.user.startServices = true;
  programs.zsh.enable = true;
  programs.git.enable = true;


}
