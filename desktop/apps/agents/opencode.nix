{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.opencode = {
    enable = true;
    package = pkgs.opencode;
    settings = {
      model = "openrouter/stealth/ox-alpha";
    };
  };
}
