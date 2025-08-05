{config, pkgs, ...}:
{
   home.packages = [
    pkgs.eww
  ];

   programs.eww = {
    enable = true;
    configDir = ./eww;
  };

}
