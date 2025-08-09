{ lib, ...}:
{
  # Сборщик всех модулей Home-Manager
  imports = [
    ./git.nix
    ./htop.nix
    ./alacritty.nix
    ./gtk.nix
    ./stylix.nix

  ];
}
