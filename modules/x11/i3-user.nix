{ config, options, lib, pkgs, modulesPath, ... }: 

{

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps; 
    config = {
      modifier = "Mod1";
      floating = {
        criteria = [
          {
            class = "weixin";
          } 
        ];
      };
      window = {
        titlebar = false;
      };
      terminal = "${pkgs.alacritty}/bin/alacritty";
    };
  };
}
