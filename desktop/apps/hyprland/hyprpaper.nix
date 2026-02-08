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
      splash = false;
      wallpaper = [
        {
          monitor = "eDP-1";
          path = "${config.home.homeDirectory}/Pictures/wallpapers/sky4.png";
        }
      ];
    };
  };
}
