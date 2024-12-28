{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.unstable.vimPlugins; [
      melange-nvim
      vim-airline
      vim-airline-themes
      indent-blankline-nvim
      mini-icons
      mini-files
      plenary-nvim
      nvim-web-devicons
      telescope-nvim
      telescope-fzf-native-nvim
      # Treesitter
      nvim-treesitter
    ];
    extraPackages = [
      pkgs.unstable.ripgrep
    ];
    extraConfig = builtins.readFile ./init.vim;
    extraLuaConfig = builtins.readFile ./init.lua;
  };
}
