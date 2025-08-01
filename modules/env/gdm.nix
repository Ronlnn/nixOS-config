{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.gnome.enable {
    # Включаем X11 и GDM
    services.xserver.enable = true;
    services.xserver.displayManager.gdm = {
      enable = true;
      wayland = true; # по желанию, можно отключить
    };

    # Установка системных тем, иконок и курсоров
    environment.systemPackages = with pkgs; [
      pkgs.gnome-themes-extra
      pkgs.adwaita-icon-theme
      catppuccin-gtk
      catppuccin-cursors.mochaLavender
      papirus-icon-theme
    ];


    # Если нужен авто-логин (по желанию)
    # services.xserver.displayManager.autoLogin.enable = true;
    # services.xserver.displayManager.autoLogin.user = "roninn";
  };
}
