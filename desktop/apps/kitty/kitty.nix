{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    package = pkgs.unstable.kitty;
    font.name = "MesloLG";

    # Everforest Dark Medium, from kovidgoyal/kitty-themes
    # (file name without .conf: https://github.com/kovidgoyal/kitty-themes)
    themeFile = "everforest_dark_medium";

    settings = {
      background_opacity = "0.85";
      dynamic_background_opacity = "yes";
      font_size = 14.0;
    };
  };
}
