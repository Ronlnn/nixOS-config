{
  systemd.user.services.eww = {
    Unit = {
      Description = "Eww Daemon";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.eww}/bin/eww daemon";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
