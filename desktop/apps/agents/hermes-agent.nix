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
      model.default = "meituan/longcat-2.0:free";
      model.provider = "nous";
      fallback_providers = [
        {
          provider = "nous";
          model = "stepfun/step-3.7-flash:free";
        }
        {
          provider = "openrouter";
          model = "poolside/laguna-s-2.1:free";
        }
        {
          provider = "openrouter";
          model = "z-ai/glm-5.3-flash";
        }
      ];
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
