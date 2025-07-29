{ config, pkgs, ... }:

{
  # Включаем X11 и GDM
  services.xserver.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true; # по желанию, можно отключить
  };

  # Установка системных тем, иконок и курсоров
  environment.systemPackages = with pkgs; [
    gnome.gnome-themes-extra
    gnome.adwaita-icon-theme
    catppuccin-gtk
    catppuccin-cursors.mochaLavender
    papirus-icon-theme
  ];

  # DConf нужен для настройки интерфейса GDM (как и для GNOME в целом)
  programs.dconf.enable = true;

  # Настройки темы и курсора — это работает только для текущего пользователя,
  # но мы можем применить и в GDM через login user — позже покажу как.
  programs.dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Catppuccin-Mocha-Standard-Blue-Dark";
      icon-theme = "Papirus-Dark";
      cursor-theme = "catppuccin-mocha-lavender-cursors";
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/roninn/Pictures/Walls/rei.jpg";
    };
  };

  # Если нужен авто-логин (по желанию)
  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = "roninn";
}
