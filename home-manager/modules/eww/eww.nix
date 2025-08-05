{config, pkgs, ...}:
{
  programs.eww = {
    package = pkgs.eww;
    configDir = ../eww;
  };
}