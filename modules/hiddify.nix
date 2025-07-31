{ config, pkgs, ... }:

{
    systemd.services.hiddify = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.hiddify}/bin/hiddify";  # ✅ Лучший вариант
      # ИЛИ, если пакет называется иначе:
      # ExecStart = "${pkgs.hiddify-manager}/bin/hiddify";
      User = "root";  # (или лучше создать отдельного пользователя)
      Restart = "on-failure";
    };
  };
}