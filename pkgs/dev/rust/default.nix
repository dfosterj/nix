{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
    rust-analyzer
    udev
    alsa-lib
    vulkan-loader
    libxkbcommon
  ];
}
