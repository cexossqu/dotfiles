{ config, options, lib, pkgs, modulesPath, ... }: 

{

  programs  = {
    wofi = { 
      enable = true;
    };
  }; 
}
