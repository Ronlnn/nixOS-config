{ config, pkgs, ... }:

let
  hyprlandSession = ''
    [Desktop Entry]
    Name=Hyprland
    Comment=Hyprland Wayland compositor
    Exec=${pkgs.hyprland}/bin/Hyprland
    Type=Application
    DesktopNames=Hyprland
    X-GDM-SessionRegisters=true
  '';
in {
  services.xserver.enable = true;

  # Включаем SDDM
  services.displayManager.sddm.enable = true;

  # По умолчанию сессия на SDDM, можно выбрать вручную
  services.displayManager.sddm.defaultSession = "hyprland";

  # Включаем GNOME
  services.xserver.desktopManager.gnome.enable = true;

  # Добавляем сессию Hyprland в список SDDM
  environment.etc."xdg/autostart/hyprland.desktop".text = hyprlandSession;

  # Опционально: добавляем сессию вручную в папку сессий SDDM
  environment.etc."xdg/sessions/hyprland.desktop".text = hyprlandSession;

  # Настройки NVIDIA, если нужны
  hardware.opengl.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.open = false;

  # Переменные окружения для Wayland + NVIDIA (если нужно)
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    GBM_BACKEND = "nvidia-drm";
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Доп. пакеты для Wayland
  environment.systemPackages = with pkgs; [
    hyprland
    mako
    swayidle
    swaylock
    grim
    slurp
  ];
}
