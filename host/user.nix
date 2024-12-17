{ config, options, lib, pkgs, modulesPath, inputs, ... }: 

let

  utils = import ../utils/load-modules.nix;
  tool = import ../utils/tool.nix;
  # 使用加载模块功能
  allModules = utils.loadRecursiveModules ./modules;
  hmModules =  tool.filterUserNix allModules;
in

{

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
  
  home-manager.nixosModules.home-manager {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.somnium = hmModules;
	  home-manager.extraSpecialArgs = {inherit inputs;};
  }
  
}
