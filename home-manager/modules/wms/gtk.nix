{pkgs,...}:
{
  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";

  gtk.theme.package = pkgs.catppuccin-gtk;
  gtk.theme.name = "Catppuccin-Mocha-Standard-Blue-Dark";

  gtk.iconTheme.package = pkgs.tela-icon-theme;
  gtk.iconTheme.name = "Tela-dark";


}