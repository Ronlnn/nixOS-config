{ config, pkgs, ... }:

{
  # 1. Установка необходимых тем и инструментов
  home.packages = with pkgs; [
    # Тема для GTK/Qt
    catppuccin-gtk
    # Иконки
    papirus-icon-theme
    # Курсоры
    bibata-cursors
    # Инструмент для настройки Qt
    qt6ct
  ];

  # 2. Настройка GTK (для Thunar, Blueman, Pavucontrol)
  gtk = {
    enable = true;

    # Тема Catppuccin Mocha (темная)
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "standard";
        variant = "mocha";
      };
    };

    # Иконки Papirus
    iconTheme = {
      name = "Tela-dark";
      package = pkgs.tela-icon-theme;
    };

    # Курсоры Bibata Modern
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    # Настройки для GTK 3/4
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # 3. Настройка Qt (для Qt-приложений)
  qt = {
    enable = true;
    platformTheme = "qtct";  # Используем qt5ct/qt6ct для настройки

    # Стиль Breeze (интегрируется с GTK)
    style = {
      name = "Breeze";
      package = pkgs.breeze-qt5;
    };
  };

  # 4. Настройка окружения
  home.sessionVariables = {
    # Принудительно включаем темную тему
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
    QT_STYLE_OVERRIDE = "Breeze";

    # Для qt5ct/qt6ct
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  # 5. Конфигурация для qt5ct
  xdg.configFile."qt5ct/qt5ct.conf".text = ''
    [Appearance]
    custom_palette=false
    style=Breeze
    theme=Catppuccin-Mocha-Standard-Blue-Dark
    icon_theme=Papirus-Dark
    font='Sans Serif,10,-1,5,50,0,0,0,0,0'
  '';

  # 6. Настройка для отдельных приложений
  xdg.configFile."Thunar/gtkrc".text = ''
    style "thunar-style" {
      ThunarIconView::label-alpha = 0
      ThunarStandardView::expander-size = 14
    }
    class "Thunar*" style "thunar-style"
  '';
}