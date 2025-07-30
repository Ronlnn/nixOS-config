{config, lib, pkgs, ...}:
{
  config = lib.mkIf config.gnome.enable {
    
  };
}