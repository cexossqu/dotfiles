# 字体配置
{ config, options, lib, pkgs, modulesPath, ... }: 

{

  fonts.packages = with pkgs; [
      dejavu_fonts
      hack-font
      font-awesome_5
      font-awesome
      line-awesome
      liberation_ttf
      roboto
      ubuntu_font_family
      noto-fonts
      noto-fonts-lgc-plus
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      source-code-pro
      source-sans-pro
      source-serif-pro
      source-han-sans
      source-han-mono
      source-han-serif
      wqy_microhei
      wqy_zenhei
      nerd-fonts.fira-code
      corefonts
      jetbrains-mono
      wayland-utils
      libsecret
  ];
  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;

    enableDefaultPackages = true;
    fontconfig = {
      cache32Bit = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "Noto Sans Mono CJK SC" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        serif = [ "Noto Serif" ];
      };
    };
  };

  home-manager.users.somnium.fonts.fontconfig.enable = true;
}
