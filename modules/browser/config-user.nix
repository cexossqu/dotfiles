# 浏览器配置
{ config, options, lib, pkgs, modulesPath, ... }: 

{
  programs  = {
    chromium = {
      enable  = true;
      commandLineArgs = [
        "--ozone-platform-hint=auto"
      ];
    };
    firefox = {
      enable = true;
     };
  }; 

}
