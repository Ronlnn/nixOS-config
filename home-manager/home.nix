{ config, pkgs, ... }:
{
  imports = [
    ./modules/bundle.nix
    ./modules/wms/hyprland.nix
  ];
  
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.bash.enable = true;

}
