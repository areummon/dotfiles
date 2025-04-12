{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(121212aa) rgba(121212aa) 45deg";
        "col.inactive_border" = "rgba(121212aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 12;
        active_opacity = 0.80;
        inactive_opacity = 0.80;
        shadow = {
          enabled = true;
          range = 16;
          render_power = 5;
          color = "rgba(0,0,0,0.35)";
        };
        blur = {
          enabled = true;
          size = 2;
          passes = 3;
          new_optimizations = true;
          vibrancy = 0.1696;
          ignore_opacity = false;
        };
      };
      windowrulev2 = [
        #"opacity 0.8 override 0.75 override 1.0 override, class:firefox"
        #"opacity 1.0 override, title: (.*YouTube.*)$"
        "opaque, title:(.*)(Brave)$"
        "opaque, title:(.*)(Firefox)$"
        "opaque, title:(.*)(LibreWolf)$"
        # windows and workspaces
        "suppressevent maximize, class:.*"
        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "nomaxsize, class:.*"
      ];
      layerrule = [
        "blur, bar-0"
        "blur, wofi"
        "ignorealpha 0.4, wofi"
      ];
      animations = {
        enabled = "yes, please :)";
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
      };
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };
      gestures = {
        workspace_swipe = true;
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = "0.5";
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = false;
        mouse_move_enables_dpms = false;
        vfr = 1;
        vrr = 1;
      };
      "$mod" = "Super";
      bind = [
        "$mod, Q, exec, kitty"
        "$mod, C, killactive,"
        "$mod, M, exec, uwsm stop"
        "$mod, V, togglefloating,"
        #"$mod, R, exec, ${config.xdg.configHome}/rofi-theme/launcher/launcher.sh"
	"$mod, R, exec, wofi"
        "$mod, P, pseudo # dwindle"
        "$mod, J, togglesplit, # dwindle"
        "$mod_SHIFT, F, exec, firefox"
        "$mod SHIFT, D, exec, com.brave.Browser"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with {modifier} + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Binds for active windows
        "$mod SHIFT, l, movefocus, r"
        "$mod SHIFT, h, movefocus, l"
        "$mod SHIFT, j, movefocus, d"
        "$mod SHIFT, k, movefocus, u"

        # Example special workspace (scratchpad)
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with {modifier} + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];
      bindm = [
        # Move/resize windows with {modifier} + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
      bindl = [
        # Requires playerctl
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      monitor = "eDP-1, 1920x1200@60, 0x0, 1";
      exec-once = [
        "hyprpaper"
        "hyprpanel"
        "fcitx5 -d # not ${pkgs.fcitx5}/bin/fcitx5 !"
        "hyprctl setcursor McMojave 40"
      ];
    };
  };
}
