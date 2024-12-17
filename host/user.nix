{ config, options, lib, pkgs, modulesPath, inputs, ... }: 

let
  homeManager = inputs.home-manager.nixosModules.home-manager;
  utilsPath = inputs.utils;
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
    users.somnium = ({config, options, lib, pkgs, ...}: let
      utils = builtins.import (builtins.toPath "${utilsPath}/load-modules.nix");
      tool = builtins.import (builtins.toPath "${utilsPath}/tools.nix"));
      # 使用加载模块功能
      allModules = utils.loadRecursiveModules ../modules;
      hmModules =  tool.filterUserNix allModules;
    in {
      imports = hmModules;
    });
  };  
}
