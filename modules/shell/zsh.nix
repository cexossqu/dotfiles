{ config, options, lib, pkgs, ... }: 

let
  omz = toString ./oh-my-zsh;
in
{

  programs = {
    zsh.enable = true;
    tmux = {
      enable = true;
    };
  };
}
