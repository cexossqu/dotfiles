{ config, options, lib, pkgs, modulesPath, inputs, ... }: 

{

  imports = [
    inputs.stylix.homeModules.stylix
  ];
    dconf.settings = {
      "org/gnome/calculator" = {
        button-mode = "programming";
        show-thousands = true;
        base = 10;
        word-size = 64;
        window-position = lib.hm.gvariant.mkTuple [100 100];
      };
    };
    stylix = { 
      image = ./wp.jpg;
      enable = true;
      autoEnable = true;
      targets = { 
        #sway.enable = false;
        vim.enable = false;
        qutebrowser.enable = true;
        #waybar.enable = false;
        wpaperd.enable = false;
        #alacritty.enable = false;
      };
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-dune.yaml"; 
      cursor = { 
        package = pkgs.phinger-cursors;
        name = "phinger-cursors-dark";
        size = 24;
      };
      fonts = {
        # packages =  
        # emoji 
        monospace = {
          package = pkgs.noto-fonts-cjk-sans;
          name = "Noto Sans CJK SC";
        }; 
        sansSerif = {
          package = pkgs.noto-fonts-cjk-sans;
          name = "Noto Sans CJK SC";
        };
        serif = config.stylix.fonts.sansSerif;
        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
        sizes = {
          terminal = 12;
          desktop = 12;
          applications = 12;
        };
      };
      opacity.terminal = 0.8;
    };
}
