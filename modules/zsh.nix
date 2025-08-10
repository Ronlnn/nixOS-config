{config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
  users.users.roninn.shell = pkgs.zsh;
}