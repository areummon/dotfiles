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
    ];
    settings = {
      model.default = "stealth/ox-alpha";
    };
  };
  home.file = {
    ".hermes/skills/nixos-assistant/SKILL.md".source =
      ./hermes-skills/nixos-assistant/SKILL.md;

    ".hermes/skills/job-hunter/SKILL.md".source =
      ./hermes-skills/job-hunter/SKILL.md;
  };
}
