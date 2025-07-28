{ config, pkgs, ... }:

{
 # services.xserver.enable = true;  # Нужен для GNOME на Xorg
  services.displayManager.sddm.enable = true;

  #programs.hyprland.enable = true;

  #services.xserver.desktopManager.gnome.enable = true;

 # Выключаем дефолтные программы
  services.gnome.core-apps.enable = false;
  environment.etc."xdg/wayland-sessions/hyprland.desktop".text = ''
    [Desktop Entry]
    Name=Hyprland
    Comment=Hyprland Wayland compositor
    Exec=${pkgs.hyprland}/bin/Hyprland
    Type=Application
    DesktopNames=Hyprland
  '';
}
