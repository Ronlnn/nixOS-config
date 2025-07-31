{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.hiddify-app ];
  systemd.services.hiddify-vpn = {
    description = "Hiddify VPN Service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hiddify}/bin/hiddify --vpn-mode"; # Уточните правильную команду для вашего случая
      Restart = "on-failure";
      User = "root"; # Запуск от root
      Group = "root";
      # Дополнительные настройки безопасности, если нужно
      CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_RAW";
      AmbientCapabilities = "CAP_NET_ADMIN CAP_NET_RAW";
    };
  };
}