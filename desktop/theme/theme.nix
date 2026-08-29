{
  pkgs,
  lib,
  config,
  ...
}: let
  # Same source as home.packages (unstable) — two different Papirus versions
  # in the same profile make buildEnv fail with conflicting subpaths.
  papirus = pkgs.unstable.papirus-icon-theme;
in {
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Papirus-Dark";
    };
  };

  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    gtk4.theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = papirus;
    };
  };

  qt = {
    enable = true;
    style = {
      name = "adwaita-dark";
      package = with pkgs; [
        adwaita-qt
        adwaita-qt6
      ];
    };
    platformTheme.name = "adwaita";
  };
}
