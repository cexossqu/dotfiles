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
  home-manager.users.somnium.programs  = {
      #  hms.programs  = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      oh-my-zsh = {
        enable = true;
        custom = omz;
        theme  = "jovial"; 
      };
    };
  }; 
}
