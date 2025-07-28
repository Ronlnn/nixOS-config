{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;

  services.xserver.desktopManager.gnome.enable = true;

  # Файл сессии Hyprland для выбора в SDDM
  environment.etc."xdg/sessions/hyprland.desktop".text = ''
    [Desktop Entry]
    Name=Hyprland
    Comment=Hyprland Wayland compositor
    Exec=${pkgs.hyprland}/bin/Hyprland
    Type=Application
    DesktopNames=Hyprland
  '';

  # Дополнительные пакеты
  environment.systemPackages = with pkgs; [
    hyprland
    mako
    swayidle
    swaylock
  ];
}
