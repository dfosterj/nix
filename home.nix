
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

  home.file.".config/VSCodium/User" = {
      source = builtins.fetchGit {
        url = "https://github.com:dfosterj/vscodium.git";
        ref = "master";
        rev = "f7432ea6930dc02fcee0913d502f738c37bf34d6";
      };
      recursive = true;
   };
}
