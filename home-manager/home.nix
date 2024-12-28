{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    #inputs.hyprpanel.homeManagerModules.hyprpanel

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ../desktop
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default
      inputs.hyprpanel.overlay

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    username = "moka";
    homeDirectory = "/home/moka";
  };

  # Add stuff for your user as you see fit:
  # home.packages = with pkgs; [ steam ];
  home.packages = [
    pkgs.unstable.anki-bin
    pkgs.unstable.libsecret
    pkgs.unstable.grimblast
    pkgs.unstable.hyprpicker
    pkgs.unstable.hyprsunset
    pkgs.unstable.btop
    pkgs.unstable.matugen
    pkgs.unstable.swww
    pkgs.unstable.dart-sass
    pkgs.unstable.wl-clipboard
    pkgs.unstable.bluez
    pkgs.unstable.bluez-tools
    pkgs.unstable.libgtop
    pkgs.unstable.gnome-bluetooth
    pkgs.unstable.bun
    pkgs.unstable.neofetch
    pkgs.unstable.mako
    pkgs.unstable.zip
    pkgs.unstable.xz
    pkgs.unstable.unzip
    pkgs.unstable.brightnessctl
    pkgs.unstable.pamixer
    pkgs.unstable.icomoon-feather
    pkgs.hyprpanel

    # fonts
    pkgs.unstable.font-awesome
    pkgs.unstable.powerline-fonts
    pkgs.unstable.powerline-symbols
    pkgs.unstable.iosevka
    pkgs.unstable.fira-code-symbols
    pkgs.unstable.nerd-fonts.jetbrains-mono
    pkgs.unstable.nerd-fonts.fira-code
    pkgs.unstable.nerd-fonts.symbols-only
    pkgs.unstable.nerd-fonts.meslo-lg
  ];

  home.sessionVariables = {
    #Optional, hint Electron apps to use Wayland:
    NIXOS_OZONE_WL = "1";
  };

  # Line for fonts to work
  fonts.fontconfig.enable = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Temporal fix for hyprpaper & hypridle
  systemd.user.services.hypridle.Unit.After = lib.mkForce "graphical-session.target";
  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";

  # Git configuration
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "moka";
    userEmail = "minji@ciencias.unam.mx";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
