{ config, options, lib, pkgs, modulesPath, inputs, ... }: 

{

  imports = [
    # (import "${modulesPath}/nur/modules/nixos/default")
    inputs.nur.modules.nixos.default
  ];
}
