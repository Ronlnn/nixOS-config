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

  # Настройка Qt (исправленная)
  qt = {
    enable = true;
    platformTheme.name = "qtct";  # Исправленное имя опции

    # Для Qt6 используем breeze-qt6 из kdePackages
    style = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze-qt6;  # Важное исправление!
    };
  };

  home.sessionVariables = {
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
    QT_STYLE_OVERRIDE = "Breeze";
    QT_QPA_PLATFORMTHEME = "qtct";
  };

  # Конфигурация для qt5ct/qt6ct
  xdg.configFile."qt5ct/qt5ct.conf".text = ''
    [Appearance]
    style=Breeze
    icon_theme=Papirus-Dark
  '';

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    style=Breeze
    icon_theme=Papirus-Dark
  '';

  # Настройка Thunar
  xdg.configFile."Thunar/gtkrc".text = ''
    style "thunar-style" {
      ThunarIconView::label-alpha = 0
      ThunarStandardView::expander-size = 14
    }
    class "Thunar*" style "thunar-style"
  '';
}