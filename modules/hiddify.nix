{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.hiddify-app ];

  systemd.services.hiddify-vpn = {
    enable = true;
    description = "Hiddify VPN Service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      Type = "simple";
      # Используем правильное имя бинарника (выберите один вариант):
      ExecStart = "${pkgs.hiddify-app}/bin/hiddify --vpn-mode";  # Вариант 1
      # ИЛИ
      # ExecStart = "${pkgs.hiddify-app}/bin/HiddifyCli --vpn-mode";  # Вариант 2

      Restart = "on-failure";
      User = "root";
      Group = "root";
      CapabilityBoundingSet = [ "CAP_NET_ADMIN" "CAP_NET_RAW" ];
      AmbientCapabilities = [ "CAP_NET_ADMIN" "CAP_NET_RAW" ];

      # Добавляем необходимые переменные окружения
      Environment = [
        "PATH=${pkgs.coreutils}/bin:${pkgs.iproute2}/bin:${pkgs.iptables}/bin"
        "LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib"
      ];

      # Рабочая директория
      WorkingDirectory = "/tmp";
    };
  };
}