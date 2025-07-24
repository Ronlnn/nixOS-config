
  {
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  # Автоматическое добавление путей в XDG_DATA_DIRS
  systemd.user.services.flatpak-update = {
    description = "Update Flatpak";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.flatpak}/bin/flatpak update -y";
    };
  };

  environment.sessionVariables = {
    XDG_DATA_DIRS = [
      "/var/lib/flatpak/exports/share"
      "${config.home.homeDirectory}/.local/share/flatpak/exports/share"
    ];
  };
}
