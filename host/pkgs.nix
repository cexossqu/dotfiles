{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmake
    #    imagemagick 
  ]; 
}
