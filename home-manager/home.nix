{ config, pkgs, ... }:
{
  imports = [
    ./modules/bundle.nix
    ./modules/wms/hyprland.nix
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
