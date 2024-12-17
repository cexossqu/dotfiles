{ config, options, lib, pkgs, modulesPath, inputs, ... }: 

{

  imports = [
    # (import "${modulesPath}/niri/homeModules/niri ")
    inputs.niri.homeModules.niri 
  ];

  programs.niri = {
    enable = false;
    package = pkgs.niri-unstable;
    settings = {
      cursor = {
        size = config.stylix.cursor.size;
        theme = config.stylix.cursor.name;
      };
      input = {
        keyboard = {
          xkb = {
            layout = "us"; 
            # options = "ctrl:nocaps";
          };
        };
      };
      prefer-no-csd = true;
      layout = {
        default-column-width = {
          proportion = 0.5; 
        }; 
        preset-column-widths = [
          { proportion = 0.33333;}
          { proportion = 0.5;}
          { proportion = 0.66667;}
          { proportion = 0.8;}
        ];


        center-focused-column = "never";
      };      
      binds = with config.lib.niri.actions; {
        "Mod+Q".action = close-window;
         
        "Mod+D".action.spawn = "${pkgs.fuzzel}/bin/fuzzel";
        "Mod+Return".action.spawn = "${pkgs.alacritty}/bin/alacritty";
         # Focus the window above in a column       
        "Mod+Left".action = focus-column-left;
        "Mod+Down".action = focus-window-down;
        "Mod+Up".action = focus-window-up;
        "Mod+Right".action = focus-column-right;
        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        
         # Move the focused window/column
        "Mod+Ctrl+Left".action = move-column-left;
        "Mod+Ctrl+Down".action = move-window-down;
        "Mod+Ctrl+Up".action = move-window-up;
        "Mod+Ctrl+Right".action = move-column-right;
        "Mod+Ctrl+H".action = move-column-left;
        "Mod+Ctrl+J".action = move-window-down;
        "Mod+Ctrl+K".action = move-window-up;
        "Mod+Ctrl+L".action = move-column-right;

        "Mod+Ctrl+Home".action = move-column-to-first;
        "Mod+Ctrl+End".action = move-column-to-last;
         
        # Focus the monitor to the side
        "Mod+Shift+Left".action = focus-monitor-left;
        "Mod+Shift+Down".action = focus-monitor-down;
        "Mod+Shift+Up".action = focus-monitor-up;
        "Mod+Shift+Right".action = focus-monitor-right;
        "Mod+Shift+H".action = focus-monitor-left;
        "Mod+Shift+J".action = focus-monitor-down;
        "Mod+Shift+K".action = focus-monitor-up;
        "Mod+Shift+L".action = focus-monitor-right;

        # show key-hot
        "Mod+Shift+S".action = show-hotkey-overlay;
         
        # move the monitor to the side
        "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
        "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
        "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
        "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;
        
        # Switch to the workspace below
        "Mod+U".action = focus-workspace-down;
        "Mod+I".action = focus-workspace-up;
        
        "Mod+Ctrl+U".action = move-column-to-workspace-down;
        "Mod+Ctrl+I".action = move-column-to-workspace-up;
        
        "Mod+Shift+U".action = move-workspace-down;
        "Mod+Shift+I".action = move-workspace-up;
               
        "Mod+WheelScrollDown" = {
           action = focus-workspace-down;
           cooldown-ms = 150;
        };
        "Mod+WheelScrollUp" = {
           action = focus-workspace-up;
           cooldown-ms = 150;
        };
        "Mod+Ctrl+WheelScrollDown" = {
          action = move-column-to-workspace-down;
          cooldown-ms = 150;
        };
        "Mod+Ctrl+WheelScrollUp" = {
          action = move-column-to-workspace-up;
          cooldown-ms = 150;
        };
         
        "Mod+WheelScrollRight".action = focus-column-right;
        "Mod+WheelScrollLeft".action = focus-column-left;
        "Mod+Ctrl+WheelScrollRight".action = move-column-right;
        "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

        "Mod+Shift+WheelScrollDown".action = focus-column-right;
        "Mod+Shift+WheelScrollUp".action = focus-column-left;
        "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
        "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;
        
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        "Mod+Ctrl+1".action.move-column-to-workspace = 1;
        "Mod+Ctrl+2".action.move-column-to-workspace = 2;
        "Mod+Ctrl+3".action.move-column-to-workspace = 3;
        "Mod+Ctrl+4".action.move-column-to-workspace = 4;
        "Mod+Ctrl+5".action.move-column-to-workspace = 5;
        "Mod+Ctrl+6".action.move-column-to-workspace = 6;
        "Mod+Ctrl+7".action.move-column-to-workspace = 7;
        "Mod+Ctrl+8".action.move-column-to-workspace = 8;
        "Mod+Ctrl+9".action.move-column-to-workspace = 9;
         
        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+Tab".action = focus-workspace-previous;
        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = reset-window-height;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+C".action = center-column;

        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";

        "Mod+Shift+Minus".action.set-window-height = "-10%";
        "Mod+Shift+Equal".action.set-window-height = "+10%";
        
      };
      outputs = {
        "DP-1"  = {
          enable = true;
          mode = {
            height = 1440;
            width = 2560;
            refresh = 165.001;
          };
          scale = 1.333;
          position = {
            x = 1920;
            y = 0;
          };
          # scale = 1.0;
        };
        "HDMI-A-1"  = {
          enable = true;
          mode = {
            height = 1080;
            width = 1920;
            refresh = 60.000;
          };
          scale = 1.0;
          # transform = {
          #   flipped = false;
          #   rotation = 90;
          # };
        };
      };
      workspaces = {
        "01-xwayland" = {
          name = "wayland"; 
        };
        "02-xwayland" = {
          name = "xwayland"; 
        };
      };
      window-rules = [
        {
          matches = [
            {
              app-id = "Alacritty";
            }
          ]; 
          opacity = 1.0;
          open-maximized = false; 
          geometry-corner-radius = {
            bottom-left = 12.0; 
            bottom-right = 12.0; 
            top-left = 12.0; 
            top-right = 12.0; 
          };
          clip-to-geometry = true;
        }
        {
          matches = [
            {
              app-id = "org.freedesktop.Xwayland";
            }
          ]; 
          opacity = 1.0;
          open-maximized = false; 
          open-on-workspace = "xwayland";
          default-column-width = {
            proportion = 1.0; 
          }; 
        }
        {
          matches = [
            {
              app-id = "org.qutebrowser.qutebrowser";
            }
          ]; 
          opacity = 0.8;
          open-maximized = false; 
          geometry-corner-radius = {
            bottom-left = 12.0;
            bottom-right = 12.0;
            top-left = 12.0;
            top-right = 12.0;
          };
          clip-to-geometry = true;
          default-column-width = {
            proportion = 0.8; 
          }; 
        }
      ];
      environment = {
        QT_QPA_PLATFORM = "wayland";
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
        SDL_IM_MODULE = "fcitx";
        INPUT_METHOD= "fcitx";
        GLFW_IM_MODULE = "ibus"; 
        DISPLAY = ":0";
      };
    };
  };
}
