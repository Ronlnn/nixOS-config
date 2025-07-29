{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Клавиатура
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Выключаем дефолтные программы
  services.gnome.core-apps.enable = false;
}
