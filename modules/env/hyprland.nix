{config, lib, pkgs, inputs, ...}:
{
imports = [
	./sddm.nix
  ../interface/waybar.nix
];

  config = lib.mkIf config.hyprland.enable {

     programs.hyprland = {
       enable = true;
       xwayland.enable = true;
       package = inputs.hyprland.package.${pkgs.system}.hyprland;
     };

    services = {
      pipewire = {
        enable = true;
      };
      clipmenu = {
        enable = true;
      };
      seatd = {
        enable = true;
      };
      upower = {
        enable = true;
      };
    };

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
    # Нужно
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    environment.systemPackages = with pkgs; [
      # Wayland терминал
      foot
      # Виджеты
      eww
      # Панель бар
      waybar
      # Аналог rofi
      wofi
      # Скриншоты
      grimblast
      grim
      # Выделение области экрана для grim
      slurp
      # Демон уведомлений
      mako
      # Экран-лок
      swaylock
      # Демон бездействия
      swayidle
      # Позволяет запускать +-приложения под wayland
      xwayland
      # Меню выхода
      wlogout
      # зависимости
      wlroots
      # Портал, совместимый с wlroots — полезно для приложений, которым нужен доступ к скриншотам
      xdg-desktop-portal-wlr
      # Яркость экрана
      brightnessctl
      # Звук, микрофон, видео
      pamixer
      # GUI для сетей
      networkmanagerapplet
      # Буферв обмена
      clipmenu
      wl-clipboard
      # Менеджер истории буфера обмена
      cliphist
       # Мост для интеграции Wayland-приложений с Hyprland, например для screencast и screenshot.
      xdg-desktop-portal-hyprland
      # Обои в среде wayland
      swww
      # Демон управления устройствами ввода
      seatd
      # Файловый менеджер
      xfce.thunar

      hyprland
	    kitty
      # Fonts
      jetbrains-mono
      fira-code
    ];
  };
}
