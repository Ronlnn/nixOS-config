{ config, lib, pkgs, hyprland,  ... }:

{
  imports = [
    ./home-manager/modules/wms/hyprland/hyprland.nix
    #./home-manager/modules/wms/gnome.nix
    ./home-manager/modules/bundle.nix
  ];

 home = {
  username = "roninn";
  homeDirectory = "/home/roninn";
  stateVersion = "25.05";
 };

  systemd.user.startServices = true;


  programs.bash = {
    enable = true;
    shellAliases = {
      nix-backup = "/home/roninn/nix-backup.sh";
    };
  };

  programs.hyprland = {
  	enable = true;
  	package = hyprland.package.${pkgs.system}.hyprland;
  };

}
