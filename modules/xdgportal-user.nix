{ config, options, lib, pkgs, modulesPath, ... }: 

{

    
    home = {
      packages = [
        pkgs.xdg-user-dirs
      ];
    };
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-gtk
      ]; 
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
      };
    };
}
