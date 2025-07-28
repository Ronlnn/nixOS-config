{ config, pkgs, ... }:

{
  services.xserver.enable = true;  # Нужен для GNOME на Xorg
  services.displayManager.sddm.enable = true;

  programs.hyprland.enable = true;

  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland
    mako
    swayidle
    swaylock
  ];

  environment.etc."xdg/wayland-sessions/hyprland.desktop".text = ''
    [Desktop Entry]
    Name=Hyprland
    Comment=Hyprland Wayland compositor
    Exec=${pkgs.hyprland}/bin/Hyprland
    Type=Application
    DesktopNames=Hyprland
  '';
}
