{ config, options, lib, pkgs, modulesPath, ... }: 

{
  programs.eww = {
    enable = true;
    configDir = ./config;
  }; 
}
