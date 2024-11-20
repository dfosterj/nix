{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pyenv
    python3
    python3Packages.pip
    python3Packages.pynvim
  ];
}

