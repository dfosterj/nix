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
          LazyVim
          bufferline-nvim
          catppuccin-nvim
          clangd_extensions-nvim
          cmp-buffer
          cmp-nvim-lsp
          cmp-nvim-ultisnips
          cmp-path
          cmp_luasnip
          conform-nvim
          crates-nvim
          csharpls-extended-lsp-nvim
          cyberdream-nvim
          dashboard-nvim
          diffview-nvim
          dracula-nvim
          dressing-nvim
          friendly-snippets
          gitsigns-nvim
          gruber-darker-nvim
          gruvbox-nvim
          indent-blankline-nvim
          kanagawa-nvim
          lazy-nvim
          lualine-nvim
          luasnip
          mason-lspconfig-nvim
          mason-nvim
          miasma-nvim
          mini-nvim
          neo-tree-nvim
          noice-nvim
          nui-nvim
          nvim-cmp
          nvim-dap
          nvim-dap-go
          nvim-dap-python
          nvim-dap-ui
          nvim-dap-virtual-text
          nvim-lint
          nvim-lspconfig
          nvim-nio
          nvim-notify
          nvim-treesitter
          nvim-treesitter-textobjects
          nvim-ts-autotag
          omnisharp-extended-lsp-nvim
          onedark-nvim
          persistence-nvim
          plenary-nvim
          rustaceanvim
          telescope-fzf-native-nvim
          telescope-nvim
          todo-comments-nvim
          toggleterm-nvim
          tokyonight-nvim
          trouble-nvim
          ultisnips
          which-key-nvim
        ];
      };
    };
  };
}
