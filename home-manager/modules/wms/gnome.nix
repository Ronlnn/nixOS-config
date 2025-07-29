{
  programs.dconf.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Catppuccin-Mocha-Standard-Blue-Dark";
      icon-theme = "cat-mocha-blue";
      cursor-theme = "catppuccin-mocha-lavender-cursors";
      color-scheme = "prefer-dark";
      enable-animations = true;
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file://${config.home.homeDirectory}/Pictures/Walls/guts-armor-blue.jpg";
      picture-uri-dark = "file://${config.home.homeDirectory}/Pictures/Walls/guts-armor-blue.jpg";
      primary-color = "#8627E6";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-timeout = 3600;
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
        "blur-my-shell@aunetx"
      ];
    };
  };
}
