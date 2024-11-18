{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    gdb
    cmake
    clang
    lld
    bear
    ninja
  ];
}

