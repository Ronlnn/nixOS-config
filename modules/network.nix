{ config, pkgs, lib, ... }:

{
  networking.networkmanager.enable = true;
  #networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
 # networking.enableIPv6 = true;
  #networking.useNetworkd = false;
  boot.kernelModules = [ "tun" "fuse" ];
  networking.useDHCP = lib.mkForce false;

  networking.networkmanager.dns = "systemd-resolved";

  services.resolved.enable = true;




}
