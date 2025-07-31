{ config, pkgs, ... }:

{
  systemd.services.hiddify-vpn = {
    description = "Hiddify VPN Mode (TUN)";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    execStart = [ "${pkgs.hiddify-app}/bin/hiddify" "start" "--mode" "tun" ];
    restart = "on-failure";
    user = "root";
    capabilityBoundingSet = [ "CAP_NET_ADMIN" "CAP_NET_BIND_SERVICE" ];
    systemd.services.hiddify-vpn.serviceConfig.AmbientCapabilities = [ "CAP_NET_ADMIN" "CAP_NET_BIND_SERVICE" ];

  };
}
