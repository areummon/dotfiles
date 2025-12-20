{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscode;
    mutableExtensionsDir = true;
    profiles.default.enableExtensionUpdateCheck = true;
  };
}
