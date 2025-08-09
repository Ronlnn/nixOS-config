{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    catppuccin-gtk
    papirus-icon-theme
    bibata-cursors
    qt6ct
    libsForQt5.qt5ct  # Для совместимости с Qt5
  ];

  # Настройка GTK
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "standard";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };


  home.sessionVariables = {
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
  };


  # Настройка Thunar
  xdg.configFile."Thunar/gtkrc".text = ''
    style "thunar-style" {
      ThunarIconView::label-alpha = 0
      ThunarStandardView::expander-size = 14
    }
    class "Thunar*" style "thunar-style"
  '';
}