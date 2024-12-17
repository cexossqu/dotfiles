{ config, options, lib, pkgs, modulesPath, ... }: 

{

  home = {
    packages = [
     # rime-data
      pkgs.grim
      pkgs.slurp
      pkgs.flameshot
      pkgs.xdg-user-dirs
    ];
  };
}
