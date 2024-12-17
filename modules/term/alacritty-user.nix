
{ config, options, lib, pkgs, ... }: 

{

  # 只有somnium才有alacritty
  programs = {
    alacritty = {
      enable = true;
      # 自定义配置
      settings = {
        env.TERM = "xterm-256color";
        font = {
          # draw_bold_text_with_bright_colors = true;
        };
        scrolling.multiplier = 5;
        selection.save_to_clipboard = true;
        font = {
           normal = lib.mkForce {
             # family = "SauceCodePro Nerd Font";
             family = "FiraCode Nerd Font";
             style = "Medium";
           };
           bold = lib.mkForce {
             family = "FiraCode Nerd Font";
             style =  "Black";
           };
          italic = lib.mkForce {
             family = "FiraCode Nerd Font";
             style = "Italic";
           };
          bold_italic = lib.mkForce {
            family = "FiraCode Nerd Font";
            style = "Bold Italic";
          };
        #  size = 12;
        };
        # window = { 
        #  opacity = 0.85;
        # };
      };
    };
  };
}
