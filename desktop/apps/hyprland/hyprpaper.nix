{ pkgs, config, lib, ... }:
{
  services.hyprpaper = {
    enable = false;
    package = pkgs.unstable.hyprpaper;
    settings = {
      ipc = "off";
      preload = [
        "${config.home.homeDirectory}/Pictures/wallpapers/wallpaper1.jpg"
      ];
      wallpaper = [
        ",${config.home.homeDirectory}/Pictures/wallpapers/wallpaper1.jpg"
      ];
    };
  };
}
