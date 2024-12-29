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
  home.packages = with pkgs.unstable;
    [
      anki-bin
      neofetch
      # util
      zip
      xz
      unzip
      bat
      # flatpak
      libsecret
      # hyprpanel
      brightnessctl
      pamixer
      icomoon-feather
      grimblast
      btop
      matugen
      swww
      dart-sass
      wl-clipboard
      bluez
      bluez-tools
      libgtop
      gnome-bluetooth
      bun
      # hyprland
      hyprpicker
      hyprsunset
      # fonts
      font-awesome
      powerline-fonts
      powerline-symbols
      iosevka
      fira-code-symbols
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
      nerd-fonts.meslo-lg
    ]
    ++ [pkgs.hyprpanel];

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
