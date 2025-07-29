{ config, pkgs, ... }:

{
  imports = [
    ./gdm.nix
  ];
  # Включение gnome
  services.xserver.desktopManager.gnome.enable = true;

  # Клавиатура
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  # Выключаем дефолтные программы
  services.gnome.core-apps.enable = false;
}
