{ config, pkgs, ... }:

{
  systemd.services.hiddify-vpn = {
    description = "Hiddify VPN Service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.hiddify-app}/bin/hiddify --run-vpn";
      AmbientCapabilities = [ "CAP_NET_ADMIN" "CAP_NET_BIND_SERVICE" ];
      CapabilityBoundingSet = [ "CAP_NET_ADMIN" "CAP_NET_BIND_SERVICE" ];
      Restart = "on-failure";
    };

    # Опционально, user и group:
    # user = "hiddify";
    # group = "hiddify";
  };
}

