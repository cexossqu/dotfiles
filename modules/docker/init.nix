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
        image = "onlyoffice/documentserver-ee";
        ports = [
          "8000:8000"
        ];
        environment = {
          JWT_SECRET= "my_jwt_secret";
        };
        volumes = [
          "/app/onlyoffice/DocumentServer/logs:/var/log/onlyoffice"
          "/app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data"
          "/app/onlyoffice/DocumentServer/lib:/var/lib/onlyoffice"
          "/app/onlyoffice/DocumentServer/db:/var/lib/postgresql"
        ];
        extraOptions = "--restart always";  # 其他 Docker 选项
      };
    };
  };
}
