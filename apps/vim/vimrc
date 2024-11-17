" vim-bootstrap 4b9115c

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "ruby,rust"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Core Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'majutsushi/tagbar'
Plug 'avelino/vim-bootstrap-updater'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"CodeSupport
Plug 'sheerun/vim-polyglot'
Plug 'hashivim/vim-terraform'
Plug 'gabrielelana/vim-markdown'
Plug 'davidhalter/jedi-vim'
Plug 'OrangeT/vim-csharp'

" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-scripts/c.vim'
" rust
" Vim racer
Plug 'racer-rust/vim-racer'
" Rust.vim
Plug 'rust-lang/rust.vim'
" yaml
Plug 'avakhov/vim-yaml'

"Completors and Formatters
Plug 'shougo/neocomplete'
Plug 'lifepillar/vim-mucomplete'
Plug 'Chiel92/vim-autoformat'
Plug 'frazrepo/vim-rainbow'
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'

" Colors
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

if v:version >= 703
  Plug 'Shougo/vimshell.vim'
endif

if v:version >= 704
  "" Snippets
  Plug 'SirVer/ultisnips'
endif

Plug 'honza/vim-snippets'

"" Color
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"Set swap and backup directories
set backupdir=~/.vimbackup//,/tmp//
set directory=~/.vimswaps//,/tmp//

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

"Set histroy
set history=500		" keep 50 lines of command line history


set fileformats=unix,dos,mac
set showcmd

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set nowrap

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
  "colorscheme railscasts
endif

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=0
    set t_Co=256
    highlight Normal guibg=#000000 guifg=white
    endif
else
  let g:CSApprox_loaded = 1


  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif

endif


if &term =~ '256color'
  set t_ut=
endif


"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
"let g:airline_theme = 'powerlineish'
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <Space>e :NERDTreeToggle<CR>
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
  nnoremap <silent> <leader>sh :terminal<CR>
else
  nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <C-left> :tabprevious<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
noremap <Leader>ue :UltiSnipsEdit<CR>

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
"set clipboard=unnamedplus

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('mac')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:lua_complete_omni = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" For ruby refactory
Plug 'vim-scripts/ruby-matchit'

" Ruby refactory
nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>


" rust
" Vim racer
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)


"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

""""""""""""""""""""""""""""""""""""""""
"GIT
""""""""""""""""""""""""""""""""""""""""
noremap <Leader>ga :! git add .<cr>
noremap <Leader>gad :! git add -A .<cr>
noremap <Leader>gaf :! git add %<cr>
noremap <Leader>gcm :! git commit -m "
noremap <Leader>gb :! git branch<cr>
noremap <Leader>gcb :! git checkout
noremap <Leader>gccb :! git checkout -b
noremap <Leader>gs :! git status<cr>
noremap <Leader>gr :! git reset .<cr>
noremap <Leader>gln :! git log --oneline -n 2<cr>
noremap <Leader>gll :! git log --oneline --graph --all --decorate<cr>
noremap <Leader>gl :! git log<cr>
noremap <Leader>gm :! git merge
noremap <Leader>gmt :! git mergetool --tool=meld<cr>
noremap <Leader>gcf :! git checkout %<cr>
noremap <Leader>gd :! git diff %<cr>
noremap <Leader>gp :! git push<cr>
noremap <Leader>grf :Gremove
noremap <Leader>gls :! git log --stat<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"run cmds"
noremap <Leader>rr :! ruby %<cr>
noremap <Leader>sr :! python3 %<cr>
noremap <Leader>br :! bash %<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""
"Rust
"""""""
noremap <Leader>cbr :! cargo build && cargo run<cr>
noremap <Leader>ct :! cargo test<cr>

" Custom Macros
let @f="0ji\"\<Esc>\<S-E>a\",\<Esc>0"
let @g="0ji\"\<Esc>\<S-E>l\<S-D>a\",\<Esc>"

" C && C++
noremap <Leader>gcc :! gcc % && ./a.out<cr>
noremap <Leader>ee :! g++ % && ./a.out<cr>
set background=dark
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_improved_strings=0
let g:gruvbox_italic=1

""""""""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""""""""
colorscheme PaperColor
" colorscheme codedark

autocmd ColorScheme * highlight Normal
" Define a variable for the background color
let backGroundColor = '#282828'

" Set the default background color for Vim
execute 'highlight Normal guibg=' . backGroundColor

" Set the background color for other relevant highlight groups
execute 'highlight NonText guibg=' . backGroundColor
execute 'highlight LineNr guibg=' . backGroundColor
execute 'highlight Folded guibg=' . backGroundColor
execute 'highlight EndOfBuffer guibg=' . backGroundColor
execute 'highlight SignColumn guibg=' . backGroundColor
execute 'highlight VertSplit guibg=' . backGroundColor




nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
noremap <silent> coh :call gruvbox#hls_toggle()<CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
highlight Comment ctermfg=DarkBlue

"Rainbow Paranthesis
let g:rainbow_active = 1

"Python
let g:jedi#show_call_signatures = 1
let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_select_first = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#auto_vim_configuration = 0


"vim-mucomplete
let g:mucomplete#enable_auto_at_startup = 1
"set completeopt-=preview
set completeopt+=menuone,noselect


"prettifier
map <Leader>pj <Esc>:%!ruby -rjson -e 'puts JSON.pretty_generate(JSON.load($<))'<CR>:set filetype=json<CR>
map <Leader>py <Esc>:%!ruby -ryaml -e 'puts YAML.load($<).to_yaml'<CR>:set filetype=yaml<CR>


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" IndentLine
let g:indentLine_enabled = 1
"let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"  fzf
"  fix hidden file searching
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden'
nnoremap <silent> <Space>f :Files<CR>
nnoremap <silent> <C-p> :Files<CR>

" LazyGit
nnoremap <Space>gg :FloatermNew lazygit<CR>


" buffers like nvim
" Map Shift+H to go to the previous buffer
nnoremap H :bprevious<CR>

" Map Shift+L to go to the next buffer
nnoremap L :bnext<CR>

