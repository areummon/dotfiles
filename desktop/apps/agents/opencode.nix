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
      model = "openrouter/openai/gpt-oss-120b:free";
      small_model = "openrouter/openai/gpt-oss-20b:free";
    };
  };
}
