{config, pkgs, ...}:
{
  home.packages = [ pkgs.zsh-powerlevel10k ];


  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
      styles = {
      "alias" = "fg=magenta,bold";
      };
      patterns = {
      "rm -rf *" = "fg=white,bold,bg=red";
      };
      highlighters = [
      "main"
      "brackets"
      "cursor"
      "root"
      "line"
      ];
    };
    autosuggestion = {
      enable = true;
      strategy = ["history"];
      highlight = "fg=#ff00ff,bg=cyan,bold,underline";
    };
    zplug = {
      enable = true;
      plugins = [{
        name = "romkatv/powerlevel10k";
        tags = [ "as:theme" "depth:1"];
      }];
    };
    shellAliases = {
      rebuild = "/home/roninn/nix-backup.sh";
    };
    autocd = true;
    initExtra = ''
      [[ ! -f ~/.p10k.zsh]] || source ~/.p10k.zsh
    '';
  };
}