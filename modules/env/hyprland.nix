{config, lib, pkgs, ...}:

{

imports = [
	./sddm.nix
  ../interface/waybar.nix
];

  config = lib.mkIf config.hyprland.enable {

    #  programs.hyprland = {
    #    enable = true;
    #    xwayland.enable = true;
    #  };

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
      LIBVA_DRIVER_NAME = "nvidia";
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

      foot                  # Wayland терминал
      eww                   # Виджеты
      waybar                # Панель бар
      wofi                  # Аналог rofi
      grimblast             # Скриншоты
      grim                  # Скриншоты
      slurp                 # Выделение области экрана для grim
      mako                  # Демон уведомлений
      swaylock              # Экран-лок
      swayidle              # Демон бездействия
      xwayland              # Позволяет запускать +-приложения под wayland
      wlogout               # Меню выхода
      wlroots               # зависимости
      brightnessctl         # Яркость экрана
      pamixer               # Звук, микрофон, видео
      networkmanagerapplet  # GUI для сетей
      clipmenu              # Буферв обмена
      wl-clipboard          # buffer
      cliphist              # Менеджер истории буфера обмена
      swww                  # Обои в среде wayland
      seatd                 # Демон управления устройствами ввода
      xfce.thunar           # Файловый менеджер
      nwg-displays          # Display util
	    kitty                 # terminal

      # Fonts
      jetbrains-mono
      fira-code

      # Мост для интеграции Wayland-приложений с Hyprland, например для screencast и screenshot.
      xdg-desktop-portal-hyprland
      # Портал, совместимый с wlroots — полезно для приложений, которым нужен доступ к скриншотам
      xdg-desktop-portal-wlr
    ];
  };
}
