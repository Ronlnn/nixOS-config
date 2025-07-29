{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true; # по желанию
  };

  # Тема оформления GDM
  services.gnome.gnome-themes-extra.enable = true;

  # Установка темы, иконок и курсоров — на системном уровне
  environment.systemPackages = with pkgs; [
    gnome.gnome-themes-extra
    gnome.adwaita-icon-theme
    catppuccin-gtk
    catppuccin-cursors.mochaLavender
  ];

  # Применим тему к GDM (важно: здесь пути к системным GTK темам)
  services.gdm.settings = {
    "org.gnome.desktop.interface" = {
      gtk-theme = "Catppuccin-Mocha-Standard-Blue-Dark";
      icon-theme = "Papirus-Dark";
      cursor-theme = "catppuccin-mocha-lavender-cursors";
    };
  };

  # Фоновое изображение GDM (логин экрана)
  services.gdm.background = /home/roninn/Pictures/Walls/rei.jpg;

  # Автоматический вход — если нужно
  # services.gdm.autoLogin.enable = true;
  # services.gdm.autoLogin.user = "roninn";
}
