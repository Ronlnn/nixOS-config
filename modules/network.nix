{ config, pkgs, lib, ... }:

let
  appDeps = [ pkgs.libpng pkgs.zlib pkgs.fuse3 ];
in
{
  networking.networkmanager.enable = true;
  networking.enableIPv6 = true;
  networking.useNetworkd = false;
  boot.kernelModules = [ "tun" "fuse" ];
  networking.useDHCP = true;

  networking.firewall.enable = false;

  security.wrappers.xray = {
    source = "${pkgs.xray}/bin/xray";
    owner = "root";
    group = "root";
    capabilities = "cap_net_admin,cap_net_raw+ep";
  };

  environment.sessionVariables = {
    LD_LIBRARY_PATH = lib.makeLibraryPath appDeps;
  };

  systemd.services.nekoray = {
    description = "Nekoray VPN service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.nekoray}/bin/nekoray";
      Restart = "on-failure";
      CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
      AmbientCapabilities = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
    };
  };

  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };

  services.sing-box.enable = true;
}
