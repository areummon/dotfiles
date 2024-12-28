{ pkgs, lib, config, ...}: 

{
  # Home nix imports for programs like hyprland
  imports = [
     ./shell/zsh.nix
     ./apps
     ./theme/theme.nix
  ];
}
