""" Automatically create needed files and folders on first run (*nix only) {{{
  if isdirectory('$HOME/.vim/autoload') == 0
    call system('mkdir -p $HOME/.vim/{autoload,bundle,swap,undo}')
  endif

  if isdirectory('$HOME/.local/share/nvim/plugged') == 0
    call system('mkdir $HOME/.local/share/nvim/plugged')
  endif

  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " Automatically install vim-plug if needed
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
""" }}}

""" Neo/Vim Settings {{{
  set encoding=UTF-8
  " Set tabs to 2 spaces
  set tabstop=2
  set softtabstop=0
  set shiftwidth=2
  set foldmethod=indent

  " Set indent and numbers
  set number
  set numberwidth=5
  set smartindent
  set cindent

  " Set new window position
  set splitright " Split new vertical windows right of current window .
  set splitbelow " Split new horizontal windows under current window.

  " Misc settings
  set virtualedit=all
  set clipboard=unnamed
  set more
  set scrolloff=3
  set showcmd
  set noshowmode
  set title
  set completeopt=menu,preview,longest
  set laststatus=2
  set ttyfast
  set autoread
  set noautowrite
  set autoindent
  set backspace=indent,eol,start
  set cinkeys-=0#
  set expandtab
  set termguicolors
  set incsearch
  set hlsearch
  set foldenable
  set foldlevelstart=3
  set foldnestmax=10
  set pastetoggle=<F6>

  """ Wildmode/wildmenu command-line completion {{{
    set wildignore+=*.bak,*.swp,*.swo
    set wildignore+=*.a,*.o,*.so,*.pyc,*.class
    set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.pdf
    set wildignore+=*/.git*,*.tar,*.zip
    set wildignore+=*/node_modules/*,*/dist/*,*/public/*,coverage,*/__pycache__/*
    set wildmenu
    set wildmode=longest:full,list:full
  """ }}}

  """ Return to last edit position when opening files {{{
    augroup LastPosition
      autocmd! BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal! g`\"" |
        \ endif
    augroup END
  """ }}}

  if filereadable(expand("$HOME/.onhernandes/dotfiles/vim/local/settings.vim"))
    so $HOME/.onhernandes/dotfiles/vim/local/settings.vim
  endif
""" }}}

""" Custom Mappings {{{
  so $HOME/.onhernandes/dotfiles/vim/mappings.vim

  if filereadable(expand("$HOME/.onhernandes/dotfiles/vim/local/mappings.vim"))
    so $HOME/.onhernandes/dotfiles/vim/local/mappings.vim
  endif
""" }}}

""" VimPlug {{{
  so $HOME/.onhernandes/dotfiles/vim/plugins.vim
""" }}}

