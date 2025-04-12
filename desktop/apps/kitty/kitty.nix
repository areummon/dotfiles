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
    settings = {
	background_opacity = "0.85";
	dynamic_background_opacity = "yes";
	
	foreground = "#e0e0e0";
	background = "#232733";
	
	# Standard colors
	color0 = "#1a1a1a";
	color1 = "#cc6666";
	color2 = "#66cc99";
	color3 = "#f0c674";
	color4 = "#6699cc";
	color5 = "#cc99cc";
	color6 = "#5fb3b3";
	color7 = "#d9d9d9";
	
	# Bright colors
	color8 = "#5c5c5c";
	color9 = "#ff9999";
	color10 = "#99ffcc";
	color11 = "#ffdc9e";
	color12 = "#99ccff";
	color13 = "#ffccff";
	color14 = "#9ed9d9";
	color15 = "#ffffff";
	
	font_size = 14.0;
    };
  };
}
