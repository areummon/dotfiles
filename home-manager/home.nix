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
    # If you want to use modules your own flake exports (from modules/home-manager): outputs.homeManagerModules.example
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
      papirus-icon-theme
      anki-bin
      neofetch
      mpv
      brightnessctl
      btop
      wl-clipboard
      # util
      zip
      xz
      unzip
      bat
      zathura
      xdotool
      pstree
      # flatpak
      libsecret
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
    ++ (with pkgs; [
      hyprpanel
    ]);

  home.sessionVariables = {
    #Optional, hint Electron apps to use Wayland:
    NIXOS_OZONE_WL = "1";
  };

  home.sessionPath = [
    "$HOME/.local/share/flatpak/exports/bin"
  ];

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
    userEmail = "areumm@proton.me";
  };

  # nix-direnv configuration for programming environments
  programs = {
    direnv = {
      enable = true;
      package = pkgs.unstable.direnv;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    bash.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
