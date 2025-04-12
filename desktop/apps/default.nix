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
    ./wofi/wofi.nix
    ./neovim/neovim.nix
    ./fd/fd.nix
    ./vscode/vscode.nix
  ];
}
