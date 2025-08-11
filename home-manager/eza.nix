{config, pkgs, ...}:
{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "always";
    colors = "auto";
  };
}
