{config, pkgs, ...}:
{
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
    # zplug = {
    #   enable = true;
    #   plugins = [
    #     {
    #     name = "romkatv/powerlevel10k";
    #     tags = [ "as:theme" "depth:1"];
    #     }
    #     {
    #       name = "fzf";
    #     }
    #   ];
    # };
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k";
      plugins = [
        "git"
        "fzf"
      ];
    };
    shellAliases = {
      rebuild = "/home/roninn/nix-backup.sh";
    };
    autocd = true;
    initContent = ''
      export FZF_BASE="${pkgs.fzf}/share/fzf"
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

  };
}