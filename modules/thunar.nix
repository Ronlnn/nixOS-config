{config, pkgs, ...}:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [thunar-vcs-plugin thunar-archive-plugin thunar-media-tags-plugin];
  };
}