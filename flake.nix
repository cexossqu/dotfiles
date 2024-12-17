{
  description = "somnium's chaos configuration";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  }; 
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nur.url = github:nix-community/NUR;
    niri.url = "github:sodiboo/niri-flake";
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs = inputs@{ nixpkgs, home-manager, hyprland, nur, niri, stylix, nixos-hardware, ... }: {
    nixosConfigurations = {
      "chaos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # pkgs = nixpkgs.legacyPackages.x86_64-linux;
        pkgs = import nixpkgs (import ./config/pkgs-config.nix { overlays = [ niri.overlays.niri ];});
        specialArgs = {inherit inputs;};
        modules = let
             utils = import ./utils/load-modules.nix;
             tool = import ./utils/tool.nix;
            # 使用加载模块功能
  #             libModules = utils.loadRecursiveModules ./lib;
            allModules = utils.loadRecursiveModules ./modules;
            nonUserModules = tool.filterNonUserNix allModules;
            hostModules = tool.filterNonUserNix (utils.loadRecursiveModules ./host);
            hmModules =  tool.filterUserNix allModules;
            nixosModules = nonUserModules ++ hostModules;
        in
        [
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.somnium = hmModules;
	          home-manager.extraSpecialArgs = {inherit inputs;};
          }
          ] ++ (builtins.map (str: builtins.toPath str) nixosModules) ;
      };
    };
  };
}
