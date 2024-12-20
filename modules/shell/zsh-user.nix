{ config, options, lib, pkgs, ... }: 

let
  # omz = builtins.toString ./oh-my-zsh;
  omz = "$HOME/dotfiles/modules/shell/oh-my-zsh";
in
{

  programs  = {
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
