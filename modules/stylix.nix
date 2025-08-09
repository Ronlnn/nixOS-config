{pkgs, ...}:
{
  stylix.enable = true;
  stylix.gnome.enable = false;
  stylix.kde.enable = false;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
}