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
      lualine-nvim
      nord-nvim
      vimtex
      trouble-nvim
      indent-blankline-nvim
      mini-icons
      mini-files
      plenary-nvim
      nvim-web-devicons
      telescope-nvim
      telescope-fzf-native-nvim
      # Treesitter
      nvim-treesitter
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.c
      nvim-treesitter-parsers.haskell
      nvim-treesitter-parsers.zig
      # lsp
      nvim-lspconfig
      # cmp
      nvim-cmp
      cmp-nvim-lsp
      cmp_luasnip
      luasnip
    ];
    extraPackages = [
      pkgs.unstable.ripgrep
    ];
    extraConfig = builtins.readFile ./init.vim;
    extraLuaConfig = builtins.readFile ./init.lua;
  };
}
