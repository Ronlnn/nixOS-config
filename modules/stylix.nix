{pkgs, ...}:
{
  stylix.enable = true;
  stylix.targets = {
    gnome.enable = false;
    kde.enable = false;
  };

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
}