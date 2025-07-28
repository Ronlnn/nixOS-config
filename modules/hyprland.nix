{ config, pkgs, ... }:

{
  # Включение Wayland и необходимых компонентов
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  # Настройки NVIDIA
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
    nvidia.powerManagement.enable = true;
    nvidia.open = false;
  };
   # Отключение X11, если используется только Wayland
  services.xserver.enable = false;


  # Необходимые переменные среды для Wayland + NVIDIA
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    WLR_DRM_NO_ATOMIC = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

   # Дополнительные пакеты для системы
  environment.systemPackages = with pkgs; [
    grim         # Скриншоты
    slurp        # Выбор области для скриншота
    wl-clipboard # Буфер обмена Wayland
    mako         # Уведомления
    swaylock     # Блокировка экрана
    swayidle     # Управление бездействием
  ];
}
