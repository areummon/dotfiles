{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
    };
    initExtra = lib.strings.concatStrings [
       ''
       source ~/.p10k.zsh
       '' ''
       if uwsm check may-start && uwsm select; then
	    exec systemd-cat -t uwsm_start uwsm start default
       fi
       ''
    ];
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.unstable.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k/zsh-theme";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.unstable.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];
  };
}
