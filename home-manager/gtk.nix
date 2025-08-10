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
    dracula-theme
  ];

  # 2. Настройка GTK (для Thunar, Blueman, Pavucontrol)
  gtk = {
    enable = true;

    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
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
  };
}