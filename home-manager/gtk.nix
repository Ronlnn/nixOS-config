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


  # 4. Настройка окружения
  home.sessionVariables = {
    # Принудительно включаем темную тему
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";

  };

}