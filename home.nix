
{ config, pkgs, lib, ...}:

{
  home.stateVersion = "24.05";
  home.username = "ded";
  home.homeDirectory = "/home/ded";
  programs.home-manager.enable = true;
  home.sessionVariables = {
     EDITOR = "vim";
  };


  # Home Manager packages
  home.packages = with pkgs; [
    vim
    vimPlugins.vim-plug
    git
  ];


  # Vim
#  programs.vim.enable = true;
#  programs.neovim = {
#    enable = true;
#    plugins = with pkgs.vimPlugins; [
#      lazyvim
#    ];
#  };

  # Clone the dedvim repository into the .vim directory using fetchgit
  home.file.".vim" = {
      source = builtins.fetchGit {
        url = "https://github.com/dfosterj/dedvim.git";
        rev = "d40105132fd64eb0aa240862320e7e04cf439c37";
      };
      recursive = true;
   };


   programs.git = {
     enable = true;
     userName = "David Foster";
     userEmail = "dfosterj@pm.me";
     defaultBranch = "main";
   };

  # Coding
#  programs.rvm.enable = true;
#  programs.pyenv.enable = true;


  # let
  #   kdeKeybindingFile = "/path/to/CHANGEME";  # Path to your keybinding file
  # in
  # {
  #   # Enable KDE Plasma and keybindings
  #   programs.kdeApplications = {
  #     enable = true;
  #     customKeybindingsFile = kdeKeybindingFile;
  #   };

  #   # Make sure the file exists, and you can apply KDE Plasma configuration
  #   home.file."./confs".source = kdeKeybindingFile;
  # }
}
