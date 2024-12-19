# 工具配置 例如 rar wps
{ config, options, lib, pkgs, modulesPath, ... }: 

{
  # 启用onlyoffice
  services.onlyoffice = {
    enable = false;
    hostname = "localhost";
    port = 8000;
  };
}
