{config, pkgs, ...}:
{
  imports = [
    ../fzf.nix
  ];

  home.file.".p10k.zsh" = {
    source = ./.p10k.zsh;
    executable = true;
  };
  home.packages = with pkgs; [
    fzf
    zsh-powerlevel10k
  ];

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
      "root"
      ];
    };
    autosuggestion = {
      enable = true;
      strategy = ["history"];
    };
    zplug = {
      enable = true;
      plugins = [
        {
        name = "romkatv/powerlevel10k";
        tags = [ "as:theme" "depth:1"];
        }
      ];
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
    shellAliases = {
      rebuild = "/home/roninn/nix-backup.sh";
    };
    autocd = true;
    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

  };
}