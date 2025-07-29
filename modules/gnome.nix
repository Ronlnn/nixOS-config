{ config, pkgs, ... }:

{
  # Включение gnome
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Клавиатура
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  # Выключаем дефолтные программы
  services.gnome.core-apps.enable = false;
}
