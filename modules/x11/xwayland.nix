# xwayland相关配置
{ config, options, lib, pkgs, modulesPath, ... }: 

{

  # 安装cifs-utils相关
  environment.systemPackages = with pkgs; [
    sway
    greetd.gtkgreet
    cage
    xwayland
    xwayland-run
    xorg.xsetroot
    xorg.libxcb
    swaybg
    # pkgs.st
    base16-schemes
    xwaylandvideobridge
  ];
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    videoDrivers = [ "amdgpu" ];
    windowManager.i3.enable = true;
  };
  xdg.autostart.enable = true;
}
