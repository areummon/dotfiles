{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      sd = "cd ~ && cd \$(fd --type d | fzf)";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = lib.strings.concatStrings [
      ''
             if uwsm check may-start && uwsm select; then
        exec systemd-cat -t uwsm_start uwsm start default
             fi
      ''
      ''
        autoload -Uz compinit && compinit
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      ''
      ''
        bindkey -v  # Enable vi mode
        bindkey "$key[Up]" history-beginning-search-backward
        bindkey "$key[Down]" history-beginning-search-forward
        bindkey '^E' end-of-line
      ''
      ''
        export KEYTIMEOUT=1  # Reduce mode switch delay
      ''
    ];
  };

  programs.fzf = {
    enable = true;
    package = pkgs.unstable.fzf;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    package = pkgs.unstable.eza;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };
}
