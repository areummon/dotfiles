# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # neovim-nightly-overlay.overlays.default

      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # disable channels
    #channel.enable = false;

    # make flake registry and nix path match flake inputs
    #registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    #nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

    # Perform garbage collection weekly to maintain low disk usage
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };

    # Optimize storage
    # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
    settings.auto-optimise-store = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Limit the number of generations to keep
  boot.loader.systemd-boot.configurationLimit = 10;
  # boot.loader.grub.configurationLimit = 10;

  boot.initrd.luks.devices."luks-2a23b25c-f966-49a7-bd0b-fd56274e81f7".device = "/dev/disk/by-uuid/2a23b25c-f966-49a7-bd0b-fd56274e81f7";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      insertNameservers = ["1.1.1.1" "8.8.8.8"];
      plugins = [
        pkgs.unstable.networkmanager-openvpn
      ];
    };
  };

  # bluetooth configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # fcitx configuration
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-hangul
      fcitx5-gtk
    ];
    fcitx5.waylandFrontend = true;
  };
  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    # Add users
    moka = {
      isNormalUser = true;
      description = "moka";
      extraGroups = ["networkmanager" "wheel"];
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      packages = with pkgs; [];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs.unstable; [
    git
    vim
    wget
    nautilus
  ];

  services.fwupd.enable = true;

  # Hyrpland NixOS module
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      # Import your home-manager configuration
      moka = import ../home-manager/home.nix;
    };
  };

  # UWSM configuration
  programs.hyprland.withUWSM = true;

  programs.zsh.enable = true;
  users.users.moka.shell = pkgs.zsh;

  # Systemd configuration to turn off led of F4
  systemd.services.configure-sound-leds = rec {
    wantedBy = ["sound.target"];
    after = wantedBy;
    serviceConfig.type = "oneshot";
    script = ''
      echo off > /sys/class/sound/ctl-led/mic/mode
    '';
  };

  # Pipewire configuration
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire."pipewire" = {
      "context.properties" = {
        "default.clock.quantum" = 2048;
        "default.clock.min-quantum" = 2048;
        "default.clock.max-quantum" = 2048;
      };
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Dependencies from hyprpanel
  services.gvfs.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Hyprlock pam conf
  security.pam.services.hyprlock = {};

  # Flatpak configuration
  services.flatpak.enable = true;
  fonts.fontDir.enable = true;

  # Font configuration
  fonts.packages = with pkgs.unstable; [
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  # Gnome requirements
  programs.dconf.enable = true;

  # Maps capslock to escape when pressed and ctrl when held down
  services.interception-tools = let
    itools = pkgs.interception-tools;
    itools-caps = pkgs.interception-tools-plugins.caps2esc;
  in {
    enable = true;
    plugins = [itools-caps];
    # requires explicit paths: https://github.com/NixOS/nixpkgs/issues/126681
    udevmonConfig = pkgs.lib.mkDefault ''
      - JOB: "${itools}/bin/intercept -g $DEVNODE | ${itools-caps}/bin/caps2esc -m 0 | ${itools}/bin/uinput -d $DEVNODE"
        DEVICE:
          EVENTS:
            EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
    '';
  };

  # Docker configuration
  virtualisation.docker.enable = true;

  # VirtualBox configuration
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["moka"];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
