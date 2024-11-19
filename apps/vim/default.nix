{ pkgs, ... }:

{

  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override { }).customize {
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
	  CSApprox
	  delimitMate
	  fzf-vim
	  gruvbox
	  indentLine
	  jedi-vim
	  molokai
	  neocomplete
	  nerdcommenter
	  nerdtree
	  papercolor-theme
	  rainbow
	  rust-vim
	  tabular
	  tagbar
	  ultisnips
	  vim-airline
	  vim-airline-themes
	  vim-autoformat
	  vim-code-dark
	  vim-colors-solarized
	  vim-commentary
	  vim-csharp
	  vim-endwise
	  vim-floaterm
	  vim-fugitive
	  vim-markdown
	  vim-misc
	  vim-nix
	  vim-polyglot
	  vim-projectionist
	  vim-racer
	  vim-rails
	  vim-snippets
	  vim-terraform
	  vim-trailing-whitespace
	  vim-yaml
	  vimproc
	  vimshell
          clang_complete
	];
        opt = [];
      };
    vimrcConfig.customRC = ''
    set shell=${pkgs.bash}/bin/bash
    " Check if ~/.vim/vimrc exists and source it
      if filereadable(expand("~/.vim/vimrc"))
        source ~/.vim/vimrc
      endif
    '';
    }
  )];
}
