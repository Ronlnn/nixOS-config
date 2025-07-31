{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.hiddify-app ];  # Правильное имя пакета

  systemd.services.hiddify-vpn = {
    enable = true;
    description = "Hiddify VPN Service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hiddify-app}/bin/hiddify-app --vpn-mode";  # Исправленный путь
      Restart = "on-failure";
      User = "root";
      Group = "root";
      CapabilityBoundingSet = [ "CAP_NET_ADMIN" "CAP_NET_RAW" ];
      AmbientCapabilities = [ "CAP_NET_ADMIN" "CAP_NET_RAW" ];
      PrivateTmp = true;
      ProtectSystem = "strict";
    };
  };
}