# 声音相关配置
{ config, options, lib, pkgs, ... }: 

{
  #整个系统得环境变量
  # environment.variables = import ./host-env.nix;
  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };
}
