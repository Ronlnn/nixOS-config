{ config, pkgs, ... }:

{
  home.packages = [ pkgs.hiddify-app ];

  systemd.user.services.hiddify = {
    Unit = {
      Description = "Hiddify VPN client";
      After = [ "graphical-session-pre.target" ];
    };

    Service = {
      ExecStart = "${pkgs.hiddify-app}/bin/hiddify";
      Restart = "on-failure";
      Environment = [
        "DISPLAY=:0"
        "WAYLAND_DISPLAY=wayland-0"
        "XDG_SESSION_TYPE=wayland"
      ];
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
