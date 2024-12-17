{ config, options, lib, pkgs, modulesPath, inputs, hmModules, ... }: 

let
  homeManager = inputs.home-manager.nixosModules.home-manager;
in
{

    # 导入 Home Manager 模块
  imports = [ homeManager ];

  users = {
    users.somnium = {
      shell = pkgs.zsh;
      isNormalUser = true;
      home = "/home/somnium";
      group = "somnium";
      uid = 1000;
      extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    };
    groups = {
      somnium = {
        members = [ "somnium" ];
        gid = 1000;
      };
    };
  };
  # Home Manager 配置
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.somnium = hmModules;
  };  
}
