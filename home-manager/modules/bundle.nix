{ lib, ...}:
{
  # Сборщик всех модулей Home-Manager
  imports = [
    ./git.nix
    ./htop.nix
    ./alacritty.nix
    
  ];
  options = {
    gnome.enable = lib.mkEnableOption "Enable GNOME-related user configuration";
    hyprland.enable = lib.mkEnableOption "Enable Hyprland-related user configuration";
  };
}
