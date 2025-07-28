{ config, pkgs, ... }:

let
  hyprland = pkgs.hyprland;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      monitor = "eDP-1,1920x1080,0x0,1";

      # Базовые настройки
      env = [
        "NIXOS_OZONE_WL,1"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];

      # Автозапуск приложений
      exec-once = [
        "waybar"
        "mako"
        "swayidle -w timeout 300 'swaylock -f' timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f'"
      ];

      # Клавиатура
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      # Окна
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(7aa2f7ee) rgba(bb9af7ee) 45deg";
        "col.inactive_border" = "rgba(414868aa)";
      };

      "$mod" = "SUPER";
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
        "$mod, Return, exec, ${pkgs.alacritty}/bin/alacritty"
      ];
    };

    # Дополнительные правила для окон
    extraConfig = ''
      # Пример правил для окон
      windowrule = float,^(pavucontrol)$
      windowrule = center,^(pavucontrol)$
      windowrule = size 800 600,^(pavucontrol)$
    '';
  };

  # Автозапуск Hyprland при входе в TTY1
  programs.bash.profileExtra = ''
    if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec dbus-run-session Hyprland
    fi
  '';

  # Панель Waybar (пример)
  # programs.waybar = {
  #   enable = true;
  #   settings = {...}; # ваши настройки waybar
  #   style = ''...'';  # ваш CSS стиль
  # };

  # Необходимые пакеты
  home.packages = with pkgs; [
    firefox-wayland # Браузер с поддержкой Wayland
    swaylock       # Блокировщик экрана
    swayidle       # Управление бездействием
    wofi           # Меню приложений
    networkmanagerapplet # Апплет NetworkManager
    brightnessctl   # Управление яркостью
    pulseaudio     # Для звука (или pipewire)
  ];
}