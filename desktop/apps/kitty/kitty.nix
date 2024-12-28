{ pkgs, lib, config, ...}:

{
  programs.kitty = {
    enable = true;
    package = pkgs.unstable.kitty;
    themeFile = "Afterglow";
    font.name = "MesloLG";
    extraConfig = lib.strings.concatStrings [
      ''
      font_size 14.0
      ''
    ];
  };
}
