{ inputs, pkgs, lib, config, ...} :

{
   wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      xwayland.enable = true;
      extraConfig = let
      modifier = "SUPER";
      in lib.strings.concatStrings [
	''
 	 general {
	   gaps_in = 5
	   gaps_out = 20
	   border_size = 2

	   # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
	   col.active_border = rgba(c595cbfc) rgba(ffa066fc) 45deg
	   col.inactive_border = rgba(595959aa)

	   # Set to true enable resizing windows by clicking and dragging on borders and gaps
	   resize_on_border = false

	   # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
	   allow_tearing = false
	   layout = dwindle
         }
         decoration {
           rounding = 10 

	   # Change transparency of focused and unfocused windows
	   active_opacity = 0.75
	   inactive_opacity = 0.75

	   shadow {
		enabled = true
		range = 6
		render_power = 3
		color = rgba(1a1a1aee)
	    }

	    # https://wiki.hyprland.org/Configuring/Variables/#blur
	    blur {
		enabled = true
		size = 3
		noise = 0.0117
		contrast = 0.8916
		brightness = 0.8172
		passes = 3
		xray = true
		new_optimizations = true
		vibrancy = 0.1696
		ignore_opacity = false;
		# noblur exception settings
		# windowrule = noblur,^(firefox)$ 
		# Opacity exceptions
		windowrulev2 = opacity 0.8 override 0.75 override 1.0 override, class: firefox 
		# Override opacity for certain sites
		windowrulev2 = opacity 1.0 override, title: (.*YouTube.*|.*pixiv*.)$
	    }

	    layerrule = blur,waybar
	    layerrule = blur, ags 
	    layerrule = ignorealpha 0.4, ags
	    layerrule = blur, rofi 
	    layerrule = ignorealpha 0.4, rofi
         }
	 animations {
	   enabled = yes, please :)

	   # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

	   bezier = easeOutQuint,0.23,1,0.32,1
	   bezier = easeInOutCubic,0.65,0.05,0.36,1
	   bezier = linear,0,0,1,1
	   bezier = almostLinear,0.5,0.5,0.75,1.0
	   bezier = quick,0.15,0,0.1,1

	   animation = global, 1, 10, default
	   animation = border, 1, 5.39, easeOutQuint
	   animation = windows, 1, 4.79, easeOutQuint
	   animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
	   animation = windowsOut, 1, 1.49, linear, popin 87%
	   animation = fadeIn, 1, 1.73, almostLinear
	   animation = fadeOut, 1, 1.46, almostLinear
	   animation = fade, 1, 3.03, quick
	   animation = layers, 1, 3.81, easeOutQuint
	   animation = layersIn, 1, 4, easeOutQuint, fade
	   animation = layersOut, 1, 1.5, linear, fade
	   animation = fadeLayersIn, 1, 1.79, almostLinear
	   animation = fadeLayersOut, 1, 1.39, almostLinear
	   animation = workspaces, 1, 1.94, almostLinear, fade
	   animation = workspacesIn, 1, 1.21, almostLinear, fade
	   animation = workspacesOut, 1, 1.94, almostLinear, fade
         }
	 dwindle {
	    pseudotile = true # Master switch for pseudotiling. Enabling is bound to {modifier} + P in the keybinds section below
	    preserve_split = true # You probably want this
	 }
	 master {
	     new_status = master
	 }
	 input {
	    kb_layout = us
	    kb_variant =
	    kb_model =
	    kb_options =
	    kb_rules =

	    follow_mouse = 1

	    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

	    touchpad {
		natural_scroll = false
	    }
	 }
	 gestures {
	   workspace_swipe=true
	 }
	 device {
	     name = epic-mouse-v1
	     sensitivity = 0.5
	 }
	 misc {
	  disable_hyprland_logo=true
          disable_splash_rendering=false
          mouse_move_enables_dpms=false
          vfr=1
          vrr=1
	 }
        '' ''
	bind = ${modifier}, Q, exec, kitty
	bind = ${modifier}, C, killactive,
	bind = ${modifier}, M, exec, uwsm stop
	# bind = ${modifier}, E, exec, nau
	bind = ${modifier}, V, togglefloating,
	bind = ${modifier}, R, exec, ${config.xdg.configHome}/rofi-theme/launcher/launcher.sh
	bind = ${modifier}, P, pseudo # dwindle
	bind = ${modifier}, J, togglesplit, # dwindle
	# bind to opening firefox
	bind = ${modifier}_SHIFT, F, exec, firefox
	# bind to opening brave
	bind = ${modifier} SHIFT, D, exec, com.brave.Browser

	bind = ${modifier}, 1, workspace, 1
	bind = ${modifier}, 2, workspace, 2
	bind = ${modifier}, 3, workspace, 3
	bind = ${modifier}, 4, workspace, 4
	bind = ${modifier}, 5, workspace, 5
	bind = ${modifier}, 6, workspace, 6
	bind = ${modifier}, 7, workspace, 7
	bind = ${modifier}, 8, workspace, 8
	bind = ${modifier}, 9, workspace, 9
	bind = ${modifier}, 0, workspace, 10

	# Move active window to a workspace with {modifier} + SHIFT + [0-9]
	bind = ${modifier} SHIFT, 1, movetoworkspace, 1
	bind = ${modifier} SHIFT, 2, movetoworkspace, 2
	bind = ${modifier} SHIFT, 3, movetoworkspace, 3
	bind = ${modifier} SHIFT, 4, movetoworkspace, 4
	bind = ${modifier} SHIFT, 5, movetoworkspace, 5
	bind = ${modifier} SHIFT, 6, movetoworkspace, 6
	bind = ${modifier} SHIFT, 7, movetoworkspace, 7
	bind = ${modifier} SHIFT, 8, movetoworkspace, 8
	bind = ${modifier} SHIFT, 9, movetoworkspace, 9
	bind = ${modifier} SHIFT, 0, movetoworkspace, 10
	
	# Binds for active windows
	bind = ${modifier} SHIFT, l, movefocus, r
	bind = ${modifier} SHIFT, h, movefocus, l
	bind = ${modifier} SHIFT, k, movefocus, d
	bind = ${modifier} SHIFT, i, movefocus, u

	# Example special workspace (scratchpad)
	bind = ${modifier}, S, togglespecialworkspace, magic
	bind = ${modifier} SHIFT, S, movetoworkspace, special:magic

	# Scroll through existing workspaces with {modifier} + scroll
	bind = ${modifier}, mouse_down, workspace, e+1
	bind = ${modifier}, mouse_up, workspace, e-1

	# Move/resize windows with {modifier} + LMB/RMB and dragging
	bindm = ${modifier}, mouse:272, movewindow
	bindm = ${modifier}, mouse:273, resizewindow

	# Laptop multimedia keys for volume and LCD brightness
	bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
	bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
	bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
	bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
	bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-

	# Requires playerctl
	bindl = , XF86AudioNext, exec, playerctl next
	bindl = , XF86AudioPause, exec, playerctl play-pause
	bindl = , XF86AudioPlay, exec, playerctl play-pause
	bindl = , XF86AudioPrev, exec, playerctl previous
        '' ''
	# windows and workspaces
	windowrulev2 = suppressevent maximize, class:.*
	# Fix some dragging issues with XWayland
	windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
	windowrulev2 = nomaxsize, class:.*
	'' ''
	exec-once= hyprpaper
	exec-once= hyprpanel
	exec-once= fcitx5 -d # not ${pkgs.fcitx5}/bin/fcitx5 !
	'' ''
	monitor = eDP-1, 1920x1200@60, 0x0, 1
	''
      ];
    };
}
