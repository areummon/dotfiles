{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./opencode.nix
    ./hermes-agent.nix
    ./agents-md.nix
  ];
}
