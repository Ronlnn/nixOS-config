{pkgs, ...}:
{
  qt.enable = true;
  qt.platformTheme.name = "gtk";

  qt.style.name = "Dracula";

  qt.style.package = pkgs.dracula-theme;
}