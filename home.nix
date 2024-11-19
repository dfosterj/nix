
{ config, pkgs, lib, ...}:

{
  home.stateVersion = "24.05";
  home.username = "ded";
  home.homeDirectory = "/home/ded";
  programs.home-manager.enable = true;
  home.sessionVariables = {
     EDITOR = "vim";
     VIMINIT = "source $HOME/.vim/vimrc";
  };

   programs.git = {
     enable = true;
     userName = "David Foster";
     userEmail = "dfosterj@pm.me";
   };

}
