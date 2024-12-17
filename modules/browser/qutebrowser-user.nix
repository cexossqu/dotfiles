{ config, options, lib, pkgs, modulesPath, ... }: 

let 
  background = "#282a36";
  background-alt =  "#282a36"; 
  background-attention = "#181920";
  border = "#282a36";
  current-line = "#44475a";
  selection = "#44475a";
  foreground = "#f8f8f2";
  foreground-alt = "#e0e0e0";
  foreground-attention = "#ffffff";
  comment = "#6272a4";
  cyan = "#8be9fd";
  green = "#50fa7b";
  orange = "#ffb86c";
  pink = "#ff79c6";
  purple = "#bd93f9";
  red = "#ff5555";
  yellow = "#f1fa8c";
in
with config.home-manager.users.somnium;
{
  programs.qutebrowser = {
    enable = true;
    settings = {
      colors = {
        completion = {
          category = { 
            bg = lib.mkForce background;
            border = {
              bottom = lib.mkForce border;
              top = lib.mkForce border;
            };
            fg = lib.mkForce foreground; 
          };
          even.bg = lib.mkForce background;
          odd.bg = lib.mkForce foreground-alt;
          fg = lib.mkForce foreground;
          item = {
            selected = {
              bg = lib.mkForce selection;
              border  = {
                bottom = lib.mkForce selection;
                top = lib.mkForce selection;
              };
              fg = lib.mkForce foreground;
            };
          };
          match.fg = lib.mkForce orange;
          scrollbar = {
            bg = lib.mkForce background;
            fg = lib.mkForce foreground;
          };
        };
        downloads = {
          bar.bg = lib.mkForce background;
          error = {
            bg = lib.mkForce background;
            fg = lib.mkForce red;
          };
          stop.bg = lib.mkForce background;
          system.bg = lib.mkForce "none";
        };
        hints = {
          bg = lib.mkForce background;
          fg = lib.mkForce purple;
          match.fg = lib.mkForce foreground-alt;
        };
        keyhint = {
          bg = lib.mkForce background;
          fg = lib.mkForce purple;
          suffix.fg = lib.mkForce selection;
        };
        messages = {
          error = {
            bg = lib.mkForce background;
            border = lib.mkForce background-alt;
            fg = lib.mkForce red;
          };
          info = {
            bg = lib.mkForce background;
            border = lib.mkForce background-alt;
            fg = lib.mkForce comment;
          };
          warning = {
            bg = lib.mkForce background;
            border = lib.mkForce background-alt;
            fg = lib.mkForce red;
          };
        };
        prompts = {
          bg = lib.mkForce background;
          border = lib.mkForce "1px solid ${background-alt}";
          fg = lib.mkForce cyan;
          selected.bg = lib.mkForce selection;
        };
        statusbar = {
          caret = { 
            bg = lib.mkForce background;
            fg = lib.mkForce orange;
            selection = {
              bg = lib.mkForce background;
              fg = lib.mkForce orange;
            };
          };
          command = {
            bg = lib.mkForce background;
            fg = lib.mkForce pink;
            private = {
              bg = lib.mkForce background;
              fg = lib.mkForce foreground-alt;
            };
          };
          insert = lib.mkForce {
            bg = background-attention;
            fg = foreground-attention;
          };
          normal = lib.mkForce {
            bg = background;
            fg = foreground;
          };
          passthrough = lib.mkForce {
            bg = background;
            fg = orange;
          };
          private = lib.mkForce {
            bg = background-alt;
            fg = foreground-alt;
          };
          progress.bg = lib.mkForce background;
          url = lib.mkForce {
            error.fg = red;
            fg = foreground;
            hover.fg = cyan;
            success = {
              http.fg = green;
              https.fg = green;
            };
            warn.fg = yellow;
          };
        };
        tabs = lib.mkForce {
          bar = {
            bg = selection;
          };
          even = {
            bg = selection;
            fg = foreground;
          };
          indicator = {
            error = red;
            start = orange;
            stop = green;
            system = "none";
          };
          odd = {
            bg = selection;
            fg = foreground;
          };
          selected = {
            even = {
              bg = background;
              fg = foreground;
            };
            odd = {
              bg = background;
              fg = foreground;
            };
          };
        };
      };
      # statusbar.padding = lib.mkForce {
      #   top = 5;
      #   right = 5;
      #   bottom = 5;
      #   left = 5;
      # };
      hints  = lib.mkForce {
        border = "1px solid ${background-alt}";
      };
      # tabs = lib.mkForce { 
      #   padding = {
      #    top = 5;
      #     right = 5;
      #     bottom = 5;
      #     left = 5;
      #  };
      #   indicator.width = 1;
      #   favicons.scale = 1;
      # };
    };
  };
}
