{
  pkgs,
  config,
  lib,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    package = pkgs.unstable.hyprpaper;
    settings = {
      ipc = "off";
      preload = [
        "${config.home.homeDirectory}/Pictures/wallpapers/wallpaper2.jpeg"
      ];
      wallpaper = [
        ",${config.home.homeDirectory}/Pictures/wallpapers/wallpaper2.jpeg"
      ];
    };
  };
}
