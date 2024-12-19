{ config, options, lib, pkgs, ... }: 

{
  # 启用docker
  virtualisation.docker.enable = true;
  # 用户组配置
  users.users.somnium.extraGroups = [ "docker" ];
  #  配置rootless
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      onlyoffice = {
       # ...
        image = "onlyoffice/documentserver";
        port = [
          "127.0.0.1:8000:8000"
        ];
      };
    };
  };
}
