{ config, lib, pkgs, ... }:

lib.mkIf config.gnome.enable {
  programs.dconf.enable = true;

  home.packages = with pkgs; [
    dracula-theme
    catppuccin-gtk
    qogir-icon-theme
    tela-icon-theme
    papirus-icon-theme
    bibata-cursors
    gnomeExtensions.user-themes
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
    };

    "org/gnome/desktop/interface" = {
      gtk-theme = "Catppuccin-Mocha-Standard-Blue-Dark";
      icon-theme = "Papirus-Dark";
      cursor-theme = "Bibata-Modern-Classic";
      font-name = "Inter 10";
    };
  };
}
