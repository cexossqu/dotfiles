# 工具配置 例如 rar wps
{ config, options, lib, pkgs, modulesPath, ... }: 

{

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    tree
    unzip
    git
    joshuto
    gnumake
    ripgrep
    fzf
    libgcc
    libgccjit
    binutils
    wechat-uos
    vanilla-dmz
    phinger-cursors
    rar
    wpsoffice-cn
    onlyoffice-desktopeditors
  ];

}
