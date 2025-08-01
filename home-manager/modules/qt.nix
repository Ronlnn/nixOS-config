{pkgs, ...}:
{
  qt.enable = true;
  qt.platformTheme = "gtk";

  qt.style.name = "Catppuccin-Mocha-Standard-Blue-Dark";

  qt.style.package = pkgs.catppuccin-gtk;
}