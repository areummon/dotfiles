{
  pkgs,
  lib,
  config,
  ...
}: {
  services.hermes-agent = {
    enable = true;
    gateway.enable = true;
    installPackage = true;
    environmentFiles = [
      "${config.home.homeDirectory}/.secrets/openrouter.env"
      "${config.home.homeDirectory}/.secrets/signal.env"
    ];
    settings = {
      model.default = "stealth/ox-alpha";
      # Free model config
      # model.default = "openai/gpt-oss-120b:free";
      # fallback_providers = [
      #   {
      #     provider = "openrouter";
      #     model = "z-ai/glm-4.5-air:free";
      #   }
      #   {
      #     provider = "openrouter";
      #     model = "openrouter/free";
      #   }
      # ];
    };
  };
  # signal-cli daemon in HTTP mode for the Hermes Signal gateway
  systemd.user.services.signal-cli-daemon = {
    Unit = {
      Description = "signal-cli daemon (HTTP mode) for Hermes gateway";
      After = ["network-online.target"];
    };
    Service = {
      ExecStart = "${pkgs.unstable.signal-cli}/bin/signal-cli --config %h/.local/share/signal-cli daemon --http 127.0.0.1:8080";
      EnvironmentFile = "${config.home.homeDirectory}/.secrets/signal.env";
      Restart = "on-failure";
      RestartSec = 10;
    };
    Install = {WantedBy = ["default.target"];};
  };

  # Skills are managed live in ~/.hermes/skills/ (real files, trusted dir).
  # The ./hermes-skills/ copies in this repo are historical snapshots only.
}
