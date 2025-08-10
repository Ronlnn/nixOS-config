{pkgs, ...}:
{
  home.packages = with pkgs; [
    dracula-qt5-theme
  ];
  qt.enable = true;
  qt.platformTheme.name = "gtk";

  qt.style.name = "Dracula";

  qt.style.package = pkgs.dracula-qt5-theme;
}