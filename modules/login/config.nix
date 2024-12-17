{ config, lib, pkgs, modulesPath, ... }:
let
  login-bg = ./lb.jpg;
  greet-css =  pkgs.writeText "greet-css" ''
    window {
      background-image: url("file://${login-bg}");
      background-size: cover;
      background-position: center;
    }
    box#body {
      background-color: rgba(50, 50, 50, 0.5);
      border-radius: 10px;
      padding: 50px;
    } 
  '';
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    default_border none
    exec ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK
    exec "${pkgs.greetd.gtkgreet}/bin/gtkgreet --command sway --style ${greet-css}; swaymsg exit"
    bindsym Mod4+shift+e exec swaynag \
	-t warning \
	-m 'What do you want to do?' \
	-b 'Poweroff' 'systemctl poweroff' \
	-b 'Reboot' 'systemctl reboot'
  '';
in
{
  environment.etc."greetd/environments".text = ''
    niri-session
    bash
  '';
  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        #command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
        command = "${pkgs.cage}/bin/cage -s -m last -- gtkgreet  -l -s ${greet-css}";
        user = "somnium";
      };
    };
  };
}
