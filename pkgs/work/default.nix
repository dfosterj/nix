
{ pkgs, ... }:

{

environment.systemPackages = with pkgs; [
  zoom
  globalprotect-openconnect
];

}

