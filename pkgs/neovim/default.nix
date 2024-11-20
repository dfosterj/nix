{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    neovim
    lua-language-server
    stylua
    ripgrep
  ];

  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
      " Check if ~/.config/nvim/init.lua exists and source it
        if filereadable(expand("~/.config/nvim/init.lua"))
          source ~/.config/nvim/init.lua
        endif
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          lazy-nvim
        ];
      };
    };
  };
}
