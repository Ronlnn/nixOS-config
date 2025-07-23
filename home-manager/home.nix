{ config, pkgs, ... }:
{
  imports = [
    ./modules/bundle.nix
  ];
  home = {
    username = "roninn";
    homeDirectory = "/home/roninn";
    stateVersion = "25.05";
  };
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.bash.enable = true;

}
