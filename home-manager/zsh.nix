{config, pkgs, ...}:
{
  home.packages = [ pkgs.zsh-powerlevel10k ];

  # Линкуем тему в oh-my-zsh custom themes
  home.file.".oh-my-zsh/custom/themes/powerlevel10k".source =
    "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";

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
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";
      plugins = [
        "git"
      ];
      custom = "$HOME/.oh-my-zsh/custom";
    };
    shellAliases = {
      rebuild = "/home/roninn/nix-backup.sh";
    };
    autocd = true;
  };
}