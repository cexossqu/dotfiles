# 用户的home配置
{ config, options, lib, pkgs, modulesPath, ... }: 

{
  # 启用别名
  home = {
    # 设置环境变量
    username = "somnium";
    homeDirectory = "/home/somnium";
    stateVersion = "23.05";
  };
  # 管理home-manager自己
  programs.home-manager.enable = true;

}
