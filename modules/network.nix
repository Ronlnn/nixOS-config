{ config, pkgs, lib, ... }:

let
  appDeps = [ pkgs.libpng pkgs.zlib pkgs.fuse3 ];
in
{
  networking.networkmanager.enable = true;
  networking.enableIPv6 = true;
  networking.useNetworkd = false;
  boot.kernelModules = [ "tun" "fuse" ];
  #networking.useDHCP = true;



  security.wrappers.xray = {
    source = "${pkgs.xray}/bin/xray";
    owner = "root";
    group = "root";
    capabilities = "cap_net_admin,cap_net_raw+ep";
  };



  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };
}
