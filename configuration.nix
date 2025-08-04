{ config, pkgs, lib ,inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/bundle.nix
      ./packages.nix
      ./modules/env/gnome.nix
      ./modules/env/hyprland.nix
    ];

  gnome.enable = false;
  hyprland.enable = true;

  config = lib.mkIf config.hyprland.enable {

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.package."${pkgs.system}".hyprland;
    };
  };
  networking.hostName = "omen";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };
  programs.firefox.enable = true;
  programs.appimage.enable = true;
  system.stateVersion = "25.05";

}
