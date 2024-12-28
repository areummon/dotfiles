{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    package = pkgs.unstable.hyprlock;
    settings = {
      background = {
        path = "${config.home.homeDirectory}/Pictures/wallpapers/background.jpg";
        blur_passes = 1;
        blur_size = 3;
      };
      image = {
        path = "${config.home.homeDirectory}/Pictures/icons/icon2.1.jpg";
        outline_thickness = 0;
        size = 150;
        rounding = -1;
        position = "0, 130";
      };
      label = [
        {
          #user
          text = "moka";
          color = "rgba(216, 222, 233, 0.8)";
          outline_thickness = 0;
          font_size = 20;
          position = "0, 26";
          halign = "center";
          valign = "center";
        }
        {
          # Day-Month-Date
          text = "cmd[update:1000] echo -e \"$(date +\"%A, %B %d\")\"";
          color = "rgba(216, 222, 233, 0.70)";
          font_size = 25;
          position = "0, 400";
          halign = "center";
          valign = "center";
        }
        {
          # Time
          text = "cmd[update:1000] echo \"<span>$(date +\"%I:%M\")</span>\"";
          color = "rgba(216, 222, 233, 0.70)";
          font_size = 30;
          position = "0, 350";
          halign = "center";
          valign = "center";
        }
      ];
      input-field = {
        size = "250, 50";
        outline_thickness = 2;
        dots_center = true;
        dots_size = 0.15;
        outer_color = "rgba(36, 36, 56, 0.8)";
        inner_color = "rgba(36, 36, 56, 0.8)";
        font_color = "rgba(255, 255, 255, 1.0)";
        position = "0, -25";
        halign = "center";
        valign = "center";
      };
    };
  };
}
