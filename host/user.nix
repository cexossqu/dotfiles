{ config, options, lib, pkgs, modulesPath, inputs, ... }: 

let

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
  
  
}
