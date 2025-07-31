{ config, pkgs, ... }:

{

  systemd.services.hiddify = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.hiddify-app}/bin/hiddify";
      User = "root";  # (или лучше создать отдельного пользователя)
      Restart = "on-failure";
    };
  };
}