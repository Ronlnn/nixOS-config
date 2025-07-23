{ config, pkgs, ... }:

{
  home.username = "roninn";
  home.homeDirectory = "/home/roninn";

  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.bash.enable = true;

  home.stateVersion = "25.05";
}
