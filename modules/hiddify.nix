{ config, pkgs, ... }:

{

  # Systemd сервис для запуска hiddify в режиме VPN (tun)
  systemd.services.hiddify-vpn = {
    description = "Hiddify VPN Mode (TUN)";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.hiddify-app}/bin/hiddify-client start --mode tun";
      Restart = "on-failure";
      User = "root";
      CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
      AmbientCapabilities = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
      ProtectSystem = "full";
      ProtectHome = true;
      PrivateTmp = true;
    };
  };
}
