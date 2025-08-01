{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.gnome.enable {
    # Включаем X11 и GDM
    services.xserver.enable = true;
    services.xserver.displayManager.gdm = {
      enable = true;
      wayland = true; # по желанию, можно отключить
    };
  };
}
