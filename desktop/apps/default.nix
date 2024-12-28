{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./kitty/kitty.nix
    ./firefox/firefox.nix
    ./hyprland
    ./rofi/rofi.nix
    ./neovim/neovim.nix
    ./fd/fd.nix
  ];
}
