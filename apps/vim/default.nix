{ pkgs, ... }:

{

  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
	  "CSApprox"
	  "delimitMate"
	  "fzf"
	  "gruvbox"
	  "indentLine"
	  "jedi-vim"
	  "molokai"
	  "neocomplete"
	  "nerdcommenter"
	  "nerdtree"
	  "papercolor-theme"
	  "ruby-matchit"
	  "rust.vim"
	  "tabular"
	  "tagbar"
	  "ultisnips"
	  "vim-airline"
	  "vim-airline-themes"
	  "vim-autoformat"
	  "vim-code-dark"
	  "vim-colors-solarized"
	  "vim-commentary"
	  "vim-csharp"
	  "vim-endwise"
	  "vim-floaterm"
	  "vim-fugitive"
	  "vim-markdown"
	  "vim-misc"
	  "vim-mucomplete"
	  "vim-nix"
	  "vim-polyglot"
	  "vim-projectionist"
	  "vim-racer"
	  "vim-rails"
	  "vim-rainbow"
	  "vim-rake"
	  "vim-rspec"
	  "vim-scripts/c.vim"
	  "vim-session"
	  "vim-snippets"
	  "vim-terraform"
	  "vim-trailing-whitespace"
	  "vim-yaml"
	  "vimproc.vim"
	  "vimshell.vim"
	];
        opt = [];
      };
    # import .vimrc
    vimrcConfig.customRC = ''
    set hidden
    set colorcolumn=80 
  '';
    }
  )];
}
