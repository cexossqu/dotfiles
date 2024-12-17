# 文件系统相关配置
{ config, options, lib, pkgs, modulesPath, ... }: 

{

  # 安装cifs-utils相关
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  # 连接dsm文件夹
  fileSystems."/mnt/dsm-share" = {
    device = "//192.168.32.210/data";
    fsType = "cifs";
    options = [ "username=somnium" "password=12138.Dsm" "vers=2.0" ];
  };

  fileSystems."/" = { 
    # device = "/dev/disk/by-uuid/1419a8cf-6a14-4fc2-b8eb-c99011b38d98";
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" =
    { 
    #device = "/dev/disk/by-uuid/8A84-FF66";
    device = "/dev/disk/by-label/boot";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ 
      { 
        device = "/dev/disk/by-label/swap";
        #device = "/dev/disk/by-uuid/ed618d3b-ee0e-4430-bcfb-0aec44c2e46d";
      }
    ];
  # 挂载u盘用
  services.udisks2.enable = true;
}
