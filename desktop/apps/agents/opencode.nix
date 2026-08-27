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
      model = "openrouter/z-ai/glm-5.3-flash";
      small_model = "openrouter/poolside/laguna-xs-2.1:free";
      #model = "openrouter/poolside/laguna-s-2.1:free";
      #small_model = "openrouter/poolside/laguna-xs-2.1:free";
      # model = "openrouter/nvidia/nemotron-3-super-120b-a12b:free";
      # small_model = "openrouter/nvidia/nemotron-3-nano-30b-a3b:free";
    };
  };
}
