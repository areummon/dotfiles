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
        "${config.home.homeDirectory}/Pictures/wallpapers/sky4.png"
      ];
      wallpaper = [
        ",${config.home.homeDirectory}/Pictures/wallpapers/sky4.png"
      ];
    };
  };
}
