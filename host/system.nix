
{ config, options, lib, pkgs, ... }: 

{

  nix = {
    settings = {
      # substituters = [
      #   "https://mirrors.ustc.edu.cn/nix-channels/store"
      #   "https://mirrors.cernet.edu.cn/nix-channels/store"
      #  "https://mirrors.sjtu.edu.cn/nix-channels/store"
      # ];
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "somnium" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  networking.hostName = "chaos"; # Define your hostname.

  programs.dconf.enable = true;

  security.rtkit.enable = true;
  security.polkit.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "en_US.UTF-8";
  programs = {
    nix-ld.enable = true;
  };
  system.stateVersion = "23.05"; # Did you read the comment?
}
