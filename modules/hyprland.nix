{ config, pkgs, ... }:

{
  # Включаем Wayland и Hyprland
  programs.hyprland.enable = true;

  # Устанавливаем пакет hyprland и утилиты
  environment.systemPackages = with pkgs; [
    hyprland
    waybar
    rofi-wayland
    dunst
    kitty
    thunar
    wofi
    grim
    slurp
    wl-clipboard
    brightnessctl
    networkmanagerapplet
    pavucontrol
  ];

  # Настройка переменных окружения
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1"; # если будут проблемы с курсором
  };

  # Отключить GNOME дисплей менеджер
services.xserver.displayManager.gdm.enable = false;
services.xserver.desktopManager.gnome.enable = false;


  # Display manager (можно заменить на greetd, sddm или оставить gdm, если он нужен)
  services.greetd.enable = true;
  services.greetd.settings = {
    defaultSession.command = "${pkgs.hyprland}/bin/Hyprland";
    defaultSession.user = "roninn";
  };

  # libinput (тачпады, мыши и т.д.)
  services.libinput.enable = true;

  # PipeWire и звук
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Сеть
  networking.networkmanager.enable = true;
}
