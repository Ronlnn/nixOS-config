{ config, pkgs, ... }:

{
  home.username = "roninn";
  home.homeDirectory = "/home/roninn";
  home.stateVersion = "25.05";

  programs.zsh.enable = true;
  programs.git.enable = true;
}
