{ inputs, config, lib, pkgs,  ... }:

{
  imports = [
    ./home-manager/wms/hyprland.nix
    #./home-manager/modules/wms/gnome.nix
    ./home-manager/bundle.nix
  ];

 home = {
  username = "roninn";
  homeDirectory = "/home/roninn";
  stateVersion = "25.05";
 };

  systemd.user.startServices = true;


  # programs.bash = {
  #   enable = true;
  #   shellAliases = {
  #     rebuild = "/home/roninn/nix-backup.sh";
  #   };
  # };


}
