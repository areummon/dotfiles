{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;

    # Main bar settings
    settings = [
      {
        layer = "top";
        mode = "dock";
        height = 0;
        width = 0;
        spacing = 0;
        reload_style_on_change = true;

        # Layout
        "modules-left" = [
          "custom/user"
          "custom/left_div#1"
          "hyprland/workspaces"
          "custom/right_div#1"
          "hyprland/window"
        ];

        "modules-center" = [
          "hyprland/language"
          "custom/left_div#2"
          "temperature"
          "custom/left_div#3"
          "memory"
          "custom/left_div#4"
          "cpu"
          "custom/left_inv#1"
          "custom/left_div#5"
          "custom/distro"
          "custom/right_div#2"
          "custom/right_inv#1"
          "idle_inhibitor"
          "clock#time"
          "custom/right_div#3"
          "clock#date"
          "custom/right_div#4"
          "network"
          "bluetooth"
          "custom/right_div#5"
        ];

        "modules-right" = [
          "mpris"
          "custom/left_div#6"
          "group/pulseaudio"
          "custom/left_div#7"
          "backlight"
          "custom/left_div#8"
          "battery"
          "custom/left_inv#2"
          "custom/power"
        ];

        # Custom modules
        "custom/user" = {
          format = "󰍜";
          min-length = 4;
          max-length = 4;
          tooltip-format = "No command set";
        };

        "custom/distro" = {
          format = "";
          tooltip = false;
        };

        "custom/power" = {
          format = "󰤄";
          on-click = "kitty -e ~/.config/waybar/scripts/power";
          tooltip-format = "Power Menu";
        };

        # Dividers – left
        "custom/left_div#1" = {
          format = "";
          tooltip = false;
        };
        "custom/left_div#2" = {
          format = "";
          tooltip = false;
        };
        "custom/left_div#3" = {
          format = "";
          tooltip = false;
        };
        "custom/left_div#4" = {
          format = "";
          tooltip = false;
        };
        "custom/left_div#5" = {
          format = "";
          tooltip = false;
        };
        "custom/left_div#6" = {
          format = "";
          tooltip = false;
        };
        "custom/left_div#7" = {
          format = "";
          tooltip = false;
        };
        "custom/left_div#8" = {
          format = "";
          tooltip = false;
        };

        "custom/left_inv#1" = {
          format = "";
          tooltip = false;
        };
        "custom/left_inv#2" = {
          format = "";
          tooltip = false;
        };

        # Dividers – right
        "custom/right_div#1" = {
          format = "";
          tooltip = false;
        };
        "custom/right_div#2" = {
          format = "";
          tooltip = false;
        };
        "custom/right_div#3" = {
          format = "";
          tooltip = false;
        };
        "custom/right_div#4" = {
          format = "";
          tooltip = false;
        };
        "custom/right_div#5" = {
          format = "";
          tooltip = false;
        };

        "custom/right_inv#1" = {
          format = "";
          tooltip = false;
        };

        # Hyprland modules
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
          };
          persistent-workspaces."*" = 5;
          on-scroll-up = "hyprctl dispatch workspace +1";
          on-scroll-down = "hyprctl dispatch workspace -1";
          cursor = true;
        };

        "hyprland/window" = {
          format = "{}";
          rewrite = {
            "" = "Desktop";
            "kitty" = "Terminal";
            "zsh" = "Terminal";
            "~" = "Terminal";
          };
          swap-icon-label = false;
        };

        "hyprland/language" = {
          "format-en" = " en";
        };

        # System modules
        temperature = {
          thermal-zone = 1;
          critical-threshold = 90;
          interval = 10;
          format = "{icon} {temperatureC}°C";
          format-critical = "󰀦 {temperatureC}°C";
          format-icons = ["󱃃" "󰔏" "󱃂"];
          min-length = 8;
          max-length = 8;
          tooltip-format = "Temperature in Fahrenheit: {temperatureF}°F";
        };

        memory = {
          interval = 10;
          format = "󰘚 {percentage}%";
          format-warning = "󰀧 {percentage}%";
          format-critical = "󰀧 {percentage}%";
          states = {
            warning = 75;
            critical = 90;
          };
          min-length = 7;
          max-length = 7;
          tooltip-format = "Memory Used: {used:0.0f}/{total:0.0f} GiB";
        };

        cpu = {
          interval = 10;
          format = "󰍛 {usage}%";
          format-warning = "󰀨 {usage}%";
          format-critical = "󰀨 {usage}%";
          states = {
            warning = 75;
            critical = 90;
          };
          min-length = 7;
          max-length = 7;
          tooltip = false;
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰈈";
            deactivated = "󰈉";
          };
          min-length = 3;
          max-length = 3;
          tooltip-format-activated = "<b>Idle Inhibitor</b>: Activated";
          tooltip-format-deactivated = "<b>Idle Inhibitor</b>: Deactivated";
          start-activated = false;
        };

        "clock#time" = {
          format = "{:%H:%M}";
          min-length = 5;
          max-length = 5;
          tooltip-format = "<b>Standard Time</b>: <span text_transform='lowercase'>{:%I:%M %p}</span>";
        };

        "clock#date" = {
          format = "󰸗 {:%d-%m}";
          min-length = 8;
          max-length = 8;
          tooltip-format = "{calendar}";
          calendar = {
            mode = "month";
            mode-mon-col = 6;
            format = {
              months = "<span alpha='100%'><b>{}</b></span>";
              days = "<span alpha='90%'>{}</span>";
              weekdays = "<span alpha='80%'><i>{}</i></span>";
              today = "<span alpha='100%'><b><u>{}</u></b></span>";
            };
          };
          actions."on-click" = "mode";
        };

        network = {
          interval = 10;
          format = "󰤨";
          format-ethernet = "󰈀";
          format-wifi = "{icon}";
          format-disconnected = "󰤯";
          format-disabled = "󰤮";
          format-icons = ["󰤟" "󰤢" "󰤥" "󰤨"];
          min-length = 2;
          max-length = 2;
          on-click = "kitty -e ~/.config/waybar/scripts/network";
          on-click-right = "~/.config/waybar/scripts/network off";
          tooltip-format = "<b>Gateway</b>: {gwaddr}";
          tooltip-format-ethernet = "<b>Interface</b>: {ifname}";
          tooltip-format-wifi = "<b>Network</b>: {essid}\n<b>IP Addr</b>: {ipaddr}/{cidr}\n<b>Strength</b>: {signalStrength}%\n<b>Frequency</b>: {frequency} GHz";
          tooltip-format-disconnected = "Wi-Fi Disconnected";
          tooltip-format-disabled = "Wi-Fi Disabled";
        };

        bluetooth = {
          format = "󰂯";
          format-disabled = "󰂲";
          format-off = "󰂲";
          format-on = "󰂰";
          format-connected = "󰂱";
          min-length = 2;
          max-length = 2;
          on-click = "kitty -e ~/.config/waybar/scripts/bluetooth";
          on-click-right = "~/.config/waybar/scripts/bluetooth off";
          tooltip-format = "Device Addr: {device_address}";
          tooltip-format-disabled = "Bluetooth Disabled";
          tooltip-format-off = "Bluetooth Off";
          tooltip-format-on = "Bluetooth Disconnected";
          tooltip-format-connected = "Device: {device_alias}";
          tooltip-format-enumerate-connected = "Device: {device_alias}";
          tooltip-format-connected-battery = "Device: {device_alias}\nBattery: {device_battery_percentage}%";
          tooltip-format-enumerate-connected-battery = "Device: {device_alias}\nBattery: {device_battery_percentage}%";
        };

        mpris = {
          format = "{player_icon} {title} - {artist}";
          format-paused = "{status_icon} {title} - {artist}";
          tooltip-format = "Playing: {title} - {artist}";
          tooltip-format-paused = "Paused: {title} - {artist}";
          player-icons."default" = "󰐊";
          status-icons."paused" = "󰏤";
          max-length = 1000;
        };

        # PulseAudio group
        "group/pulseaudio" = {
          orientation = "horizontal";
          modules = ["pulseaudio#output" "pulseaudio#input"];
          drawer."transition-left-to-right" = false;
        };

        "pulseaudio#output" = {
          format = "{icon} {volume}%";
          format-muted = "{icon} {volume}%";
          format-icons = {
            default = ["󰕿" "󰖀" "󰕾"];
            default-muted = "󰝟";
            headphone = "󰋋";
            headphone-muted = "󰟎";
            headset = "󰋎";
            headset-muted = "󰋐";
          };
          min-length = 7;
          max-length = 7;
          on-click = "~/.config/waybar/scripts/volume output mute";
          on-scroll-up = "~/.config/waybar/scripts/volume output raise";
          on-scroll-down = "~/.config/waybar/scripts/volume output lower";
          tooltip-format = "<b>Output Device</b>: {desc}";
        };

        "pulseaudio#input" = {
          format = "{format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭 {volume}%";
          min-length = 7;
          max-length = 7;
          on-click = "~/.config/waybar/scripts/volume input mute";
          on-scroll-up = "~/.config/waybar/scripts/volume input raise";
          on-scroll-down = "~/.config/waybar/scripts/volume input lower";
          tooltip-format = "<b>Input Device</b>: {desc}";
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          min-length = 7;
          max-length = 7;
          on-scroll-up = "~/.config/waybar/scripts/backlight up";
          on-scroll-down = "~/.config/waybar/scripts/backlight down";
          tooltip-format = "Screen Brightness";
        };

        battery = {
          states = {
            warning = 20;
            critical = 10;
          };
          format = "{icon} {capacity}%";
          format-time = "{H}h {M}min";
          format-icons = ["󰂎" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          format-charging = "󰉁 {capacity}%";
          min-length = 7;
          max-length = 7;
          tooltip-format = "<b>Discharging</b>: {time}";
          tooltip-format-charging = "<b>Charging</b>: {time}";
          events = {
            on-discharging-warning = "notify-send 'Battery Low (20%)' -u critical -i 'battery-020' -h string:x-canonical-private-synchronous:battery";
            on-discharging-critical = "notify-send 'Battery Critical (10%)' -u critical -i 'battery-010' -h string:x-canonical-private-synchronous:battery";
            on-charging-100 = "notify-send 'Battery Full (100%)' -i 'battery-100-charged' -h string:x-canonical-private-synchronous:battery";
          };
        };
      }
    ];

    # Style  (Wallpaper sky-blue theme — transparent + blurred bar)
    style = ''
      /* =========================================================
         Sky Blue palette — sampled from wallpaper
         ─────────────────────────────────────────
         Layers (darkest → lightest):
           deep-sky    #0e3d9e  dominant royal blue (sky BG)
           royal       #1a4db5  slightly lighter sky       ← mantle tier
           cobalt      #2358c0  mid-dark layer             ← base tier
           azure       #3d6fcc  medium blue                ← surface0 tier
           sky-mid     #5585d4  lighter blue
           sky-light   #7aa2db  desaturated light blue     ← accent
           pale-blue   #a8c4e8  pale sky near clouds
           cloud-blue  #c8dff2  cloud-shadow blue
           cloud       #ddeef8  bright cloud
           white-cloud #eef6fb  brightest cloud highlight  ← foreground
           grey-mirror #8a96a4  mirror body grey
         ========================================================= */

      /* Raw palette */
      @define-color deep-sky    #0e3d9e;
      @define-color royal       #1a4db5;
      @define-color cobalt      #2358c0;
      @define-color azure       #3d6fcc;
      @define-color sky-mid     #5585d4;
      @define-color sky-light   #7aa2db;
      @define-color pale-blue   #a8c4e8;
      @define-color cloud-blue  #c8dff2;
      @define-color cloud       #ddeef8;
      @define-color white-cloud #eef6fb;
      @define-color grey-mirror #8a96a4;

      /* Semantic aliases */
      @define-color accent      @sky-light;
      @define-color main-br     @sky-mid;
      @define-color main-bg     alpha(#0a2d7a, 0.55);
      @define-color main-fg     @white-cloud;
      @define-color hover-bg    alpha(@cobalt, 0.60);
      @define-color hover-fg    alpha(@white-cloud, 0.70);
      @define-color outline     alpha(@deep-sky, 0.70);

      /* State colors — bright enough to pop on blue */
      @define-color warning     #e8c44a;
      @define-color critical    #e05050;
      @define-color charging    #40c8b0;

      /* =========================================================
         Reset & base
         ========================================================= */
      * {
        all: initial;
        color: @main-fg;
        font-family: "CommitMono Nerd Font", "Commit Mono Nerd Font", monospace;
        font-weight: bold;
        font-size: 18px;
      }

      #window label,
      #mpris,
      tooltip label {
        font-weight: normal;
      }

      #workspaces button.active label,
      #workspaces button.focused label,
      #custom-distro {
        font-size: 20px;
      }

      #custom-power {
        font-size: 18px;
      }

      #custom-left_div,
      #custom-left_inv,
      #custom-right_div,
      #custom-right_inv {
        font-size: 22px;
      }

      /* =========================================================
         Bar shell
         ========================================================= */
      .module {
        margin-bottom: -1px;
      }

      /* Outer wrapper: fully transparent so the blur layer shows through */
      #waybar {
        background: transparent;
      }

      /* Inner box: frosted-glass panel */
      #waybar > box {
        margin: 4px;
        border-radius: 10px;
        background-color: alpha(#091e5c, 0.52);

        /* Blur — requires a Hyprland blur rule targeting waybar,
           e.g. in hyprland.conf:
             layerrule = blur, waybar
             layerrule = ignorezero, waybar       */
      }

      button {
        border-radius: 16px;
        min-width: 16px;
        padding: 0 10px;
      }
      button:hover {
        background-color: @hover-bg;
        color: @hover-fg;
      }

      tooltip {
        border: 2px solid alpha(@sky-mid, 0.60);
        border-radius: 10px;
        background-color: alpha(#0e3060, 0.82);
      }
      tooltip > box {
        padding: 0 6px;
      }

      /* =========================================================
         Left modules
         ========================================================= */

      /* Workspaces  (deep-sky) */
      #custom-left_div.1,
      #custom-right_div.1 {
        color: @deep-sky;
      }
      #workspaces {
        padding: 0 1px;
        background-color: @deep-sky;
      }
      #workspaces button.active label,
      #workspaces button.focused label {
        color: @white-cloud;
      }

      /* Window title */
      #window {
        margin: 0 12px;
      }

      /* =========================================================
         Center modules
         ========================================================= */

      /* Indicator */
      #keyboard-state label,
      #language {
        margin-right: 12px;
        color: @hover-fg;
      }

      /*
        Divider color logic — powerline arrows blend adjacent backgrounds:
          • A divider's `color`      = the module on the POINTED-TO side
          • A divider's `background` = the module on the flat/open side
          • No `background` set      = transparent (bar glass background shows)

        CENTER tier order (dark → light → accent → light → dark):
          transparent → [royal:temp] → [cobalt:mem] → [azure:cpu]
          → transparent → [sky-light:distro] → transparent
          → [azure:time+idle] → [cobalt:date] → [royal:tray] → transparent

        RIGHT tier order (right to left, dark → mid → light):
          transparent ← [royal:volume] ← [cobalt:backlight] ← [azure:battery] ← transparent
      */

      /* Temperature  (royal) */
      #custom-left_div.2 {
        color: @royal;
      }
      #temperature {
        background-color: @royal;
      }

      /* Memory  (cobalt) — bridge from royal → cobalt */
      #custom-left_div.3 {
        background-color: @royal;
        color: @cobalt;
      }
      #memory {
        background-color: @cobalt;
      }

      /* CPU  (azure) — bridge from cobalt → azure */
      #custom-left_div.4 {
        background-color: @cobalt;
        color: @azure;
      }
      #cpu {
        background-color: @azure;
      }
      /* left_inv#1: inverse arrow cpu → transparent */
      #custom-left_inv.1 {
        color: @azure;
      }

      /* Distro icon — sky-light accent pill */
      /* left_div#5 & right_div#2: transparent → sky-light → transparent */
      #custom-left_div.5,
      #custom-right_div.2 {
        color: @sky-light;
      }
      #custom-distro {
        padding: 0 10px 0 5px;
        background-color: @sky-light;
        color: @deep-sky;
      }

      /* Idle inhibitor + Time  (azure) */
      /* right_inv#1: transparent → azure */
      #custom-right_inv.1 {
        color: @azure;
      }
      #idle_inhibitor {
        background-color: @azure;
      }
      #clock.time {
        padding-right: 6px;
        background-color: @azure;
      }

      /* Date  (cobalt) — bridge from azure → cobalt */
      #custom-right_div.3 {
        background-color: @cobalt;
        color: @azure;
      }
      #clock.date {
        padding-left: 6px;
        background-color: @cobalt;
      }

      /* Tray: network / bluetooth  (royal) — bridge from cobalt → royal */
      #custom-right_div.4 {
        background-color: @royal;
        color: @cobalt;
      }
      #network {
        background-color: @royal;
        padding: 0 6px 0 4px;
      }
      #bluetooth {
        background-color: @royal;
        padding: 0 5px;
      }
      /* right_div#5: royal → transparent */
      #custom-right_div.5 {
        color: @royal;
      }

      /* =========================================================
         Right modules
         ========================================================= */

      /* Media info */
      #mpris {
        padding: 0 12px;
      }

      /* Volume  (royal) — transparent → royal */
      #custom-left_div.6 {
        color: @royal;
      }
      #pulseaudio,
      #wireplumber {
        background-color: @royal;
      }

      /* Backlight  (cobalt) — bridge from royal → cobalt */
      #custom-left_div.7 {
        background-color: @royal;
        color: @cobalt;
      }
      #backlight {
        background-color: @cobalt;
      }

      /* Battery  (azure) — bridge from cobalt → azure */
      #custom-left_div.8 {
        background-color: @cobalt;
        color: @azure;
      }
      #battery {
        background-color: @azure;
      }
      /* left_inv#2: azure → transparent */
      #custom-left_inv.2 {
        color: @azure;
      }

      /* Power menu */
      #custom-power {
        border-radius: 16px;
        padding: 0 19px 0 16px;
        color: @sky-light;
      }
      #custom-power:hover {
        background-color: alpha(@azure, 0.70);
        color: @white-cloud;
      }

      /* =========================================================
         States
         ========================================================= */

      #custom-user:hover,
      #idle_inhibitor:hover,
      #clock.date:hover,
      #network:hover,
      #bluetooth:hover,
      #mpris:hover,
      #pulseaudio:hover,
      #wireplumber:hover {
        color: @hover-fg;
      }

      /* Inactive states */
      #idle_inhibitor.deactivated,
      #mpris.paused,
      #pulseaudio.output.muted,
      #pulseaudio.input.source-muted,
      #wireplumber.muted {
        color: @hover-fg;
      }

      #memory.warning,
      #cpu.warning,
      #battery.warning {
        color: @warning;
      }

      #temperature.critical,
      #memory.critical,
      #cpu.critical,
      #battery.critical {
        color: @critical;
      }

      #battery.charging {
        color: @charging;
      }
    '';
  };

  # Scripts
  home.file = {
    ".config/waybar/scripts/backlight".source = ./scripts/backlight;
    ".config/waybar/scripts/bluetooth".source = ./scripts/bluetooth;
    ".config/waybar/scripts/network".source = ./scripts/network;
    ".config/waybar/scripts/power".source = ./scripts/power;
    ".config/waybar/scripts/volume".source = ./scripts/volume;
  };
}
