{config, pkgs, ...}:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.fzf;
    colors = {
      bg = "#44877F";
      "bg+" = "#44877F";
      fg = "#A0F04F";
      "fg+" = "#A0F04F";
    };
  };
}