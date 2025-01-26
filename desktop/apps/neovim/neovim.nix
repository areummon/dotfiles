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
      rose-pine
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
