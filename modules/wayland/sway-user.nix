{ config, options, lib, pkgs, modulesPath, ... }: 

{
  wayland.windowManager.sway = {
    enable = true;
    systemd = {
      enable = true;
      xdgAutostart = false;
      variables = [
        "DISPLAY"
        "WAYLAND_DISPLAY"
        "SWAYSOCK"
        "XDG_CURRENT_DESKTOP"
        "XDG_SESSION_TYPE"
        "NIXOS_OZONE_WL"
        "XCURSOR_THEME"
        "XCURSOR_SIZE"
      ];
    };
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      # needs qt5.qtwayland in systemPackages
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      # Fix for some Java AWT applications (e.g. Android Studio),
      # use this if they aren't displayed properly:
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
    wrapperFeatures = {
      gtk = true;
      base = true;
    };
    xwayland = true;
    config = {
      modifier = "Mod1";
      output = {
        DP-1 = {
          mode = "2560x1440@165.000Hz";
          pos = "0 0";
          res = "2560x1440";
          # scale = "1.5";
        };
        HDMI-A-1 = {
          mode = "1920x1080@60.000Hz";
          pos = "0 960";
          res = "1920x1080";
        };
      };
      window = {
        titlebar = false;
      };
      terminal = "${pkgs.alacritty}/bin/alacritty";
      # menu = "${pkgs.steam}/bin/steam";
      menu = "${pkgs.fuzzel}/bin/fuzzel";
      bars = [
      ];
      #startup = [
      #  {
      #    #command = "${pkgs.wpaperd}/bin/wpaperd"; 
      #  }
      #];
      workspaceOutputAssign = [
        {
          workspace = "1";
          output = "DP-1";
        }
        {
          workspace = "2";
          output = "DP-1";
        }
        {
          workspace = "3";
          output = "DP-1";
        }
        {
          workspace = "4";
          output = "DP-1";
        }
        {
          workspace = "5";
          output = "DP-1";
        }
        {
          workspace = "6";
          output = "HDMI-A-1";
        }
        {
          workspace = "7";
          output = "HDMI-A-1";
        }
        {
          workspace = "8";
          output = "HDMI-A-1";
        }
        {
          workspace = "9";
          output = "HDMI-A-1";
        }
        {
          workspace = "10";
          output = "HDMI-A-1";
        }
      ];
    };
  };
}
