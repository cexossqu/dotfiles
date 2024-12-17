# 简化home配置
# 废弃
{ config, options, lib, pkgs, modulesPath, inputs, ... }:

{
  # 引入 Home Manager 模块
  imports = [
    # (import "${modulesPath}/home-manager/nixosModules/home-manager")
    inputs.home-manager.nixosModules.home-manager
  ];

  
  options.hm.aliasEnable = lib.mkEnableOption "Whether to use the homemanager alias hms";

  config = lib.mkIf config.hm.aliasEnable {
    home-manager.users.somnium = config.hms;
  };
}
