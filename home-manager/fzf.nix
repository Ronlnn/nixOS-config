{config, pkgs, ...}:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.fzf;
    colors = {
      bg = "#44877F";

    };
  };
}