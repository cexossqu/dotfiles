# 壁纸设置
{ config, options, lib, pkgs, modulesPath, ... }: 
let
  wallpaperspath = ./source;
in

{
    programs.wpaperd = {
      enable = true;
      settings = {
        default = {
          path = "${wallpaperspath}/default";
          apply-shadow = true;
          duration = "15m";
          sorting = "random";
        };
        DP-1 = {
          path = "${wallpaperspath}/2560x1440";
          apply-shadow = true;
          duration = "15m";
          sorting = "random";
          mode = "center";
        };
        HDMI-A-1 = {
          path = "${wallpaperspath}/1920x1080";
          duration = "15m";
          sorting = "random";
          apply-shadow = true;
          mode = "center";
        };
      };
    };
    systemd.user.services."wpaperd" = {
      Unit = {
        Description = "wallpapers! brought to you by stylix! :3";
        PartOf = ["graphical-session.target"];
        After = ["graphical-session.target"];
        Requisite = ["graphical-session.target"];
      };
      Service = {
        # ExecStart = "${pkgs.wpaperd}/bin/wpaperd -i ${config.stylix.image}";
        ExecStart = "${pkgs.wpaperd}/bin/wpaperd";
        Restart = "on-failure";
      };
      Install = { 
        WantedBy = [ "graphical-session.target" ]; 
      };
    };
}
