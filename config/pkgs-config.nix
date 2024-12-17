{ overlays, system ? "x86_64-linux" }: 
{
  system = system;
  config = {
    allowUnfree = true;
    allowBroken = true;
    nvidia.acceptLicense = true;
    permittedInsecurePackages = [
      "openssl-1.1.1w"
      "electron-19.1.9"
    ];
  };
  overlays = overlays;
}
