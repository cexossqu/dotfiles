
# 工具配置 例如 rar wps
{ config, options, lib, pkgs, modulesPath, ... }: 
{

  home = {
    packages = [
     # rime-data
      pkgs.librime
      pkgs.telegram-desktop
      pkgs.wl-clipboard
      pkgs.libreoffice-qt
      pkgs.qq
      pkgs.clash-verge-rev
      pkgs.fuzzel
    ];
  };


}
