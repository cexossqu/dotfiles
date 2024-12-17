{ config, options, lib, pkgs, ... }: 

{

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-lua
      fcitx5-gtk
      fcitx5-configtool
      libsForQt5.fcitx5-qt
      fcitx5-mozc
      (fcitx5-rime.override {rimeDataPkgs = [
         ./fly-rime-data
      ];})
    ];
  };
}
