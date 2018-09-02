""" Automatically create needed files and folders on first run (*nix only) {{{
	call system('mkdir -p $HOME/.vim/{autoload,bundle,swap,undo}')
  call system('mkdir $HOME/.local/share/nvim/plugged')

  " Automatically install vim-plug if needed
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
""" }}}

""" Neo/Vim Settings {{{
	" Set tabs to 2 spaces
	set tabstop=2
	set softtabstop=0
	set shiftwidth=2
  set foldmethod=indent

	" Set indent and numbers
	set number
	set numberwidth=5
	set smartindent

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
""" }}}

""" Custom Mappings {{{
	" Map leader to space
	let mapleader=" "  

	" Map for moving through windows
	nnoremap <c-h> <c-w>h
	nnoremap <c-l> <c-w>l
	nnoremap <c-j> <c-w>j
	nnoremap <c-k> <c-w>k

	" Binding nvim clipboard with system's clipboard using xclip
	function! ClipboardYank()
		call system('xclip -selection clipboard', @@)
	endfunction
	function! ClipboardPaste()
		let @@ = system('xclip -selection clipboard -o')
	endfunction

	vnoremap <silent> y y:call ClipboardYank()<cr>
	vnoremap <silent> d d:call ClipboardYank()<cr>
	nnoremap <silent> p :call ClipboardPaste()<cr>p

	" Map leader + q to close buffer
	map <leader>q <esc>:call CloseCurrentBuffer()<cr>
	function! CloseCurrentBuffer()
		let todelbufNr = bufnr("%")
		let newbufNr = bufnr("#")
		if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
			exe "b".newbufNr
		else
			bnext
		endif

		if (bufnr("%") == todelbufNr)
			new
		endif
		exe "bd".todelbufNr
	endfunction
   
	" Map moving-keys for sugestions/completions in insert-mode
	imap <c-k> <c-p>
	imap <c-j> <c-n>

	" Map ; to : in normal and visual mode
	nnoremap ; :
	vmap ; :

	" Map reload and edit for vimrc
	nmap <leader>so :so $HOME/.vimrc<cr> 
	nmap <leader>rr :edit $HOME/.onhernandes/dotfiles/vimrc<cr>

  " Map :Files
  nmap <leader>f :Files<cr>

  " Bubble single lines to CTRL + ALT + j
  nmap  <c-a-j> ]e
  nmap  <c-a-k> [e

  " Bubble multiple lines to CTRL + ALT + j
  vmap <c-a-k> [egv
  vmap <c-a-j> ]egv

  " leader + space clear highlight
  nmap <silent> <leader><space> :silent noh<cr>

  " Simpler folding
  nnoremap zr zR
  nnoremap zm zM

  " jj to <esc>
  inoremap jj <esc>

  " <tab> indent
  map <tab> >gv
  map <s-tab> <gv
  nmap <tab> >>
  nmap <s-tab> <<

  " Map leader save
	nmap <leader>w :w!<cr>

  " Map next and previous buffer
	nmap <leader>l :bn<cr>
	nmap <leader>h :bp<cr>

  " Map resize horizontal splits
	nmap <leader>j :res -1<cr>
	nmap <leader>k :res +1<cr>

  " Map :Buffers
  nnoremap <leader>b :Buffers<cr>

	" Map horizontal and vertical split of the same file
	nmap <leader>s :split %<cr>
	nmap <leader>vs :vsplit %<cr>

  " Map S to s for surround plugin
  vmap s S

  " DO NOT USE THESE FUCKING ARROWS. THANKS.
	noremap <Up> ""
	noremap! <Up> <Esc>
	noremap <Down> ""
	noremap! <Down> <Esc>
	noremap <Left> ""
	noremap! <Left> <Esc>
	noremap <Right> ""             
	noremap! <Right> <Esc>   
""" }}}

""" VimPlug {{{
	call plug#begin('~/.local/share/nvim/plugged')

	" Plugins
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-tmux'
  Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-vim'
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'ncm2/ncm2-markdown-subscope'
	Plug 'SirVer/ultisnips'
	Plug 'tpope/vim-surround'
	Plug 'honza/vim-snippets'
  Plug 'rhysd/clever-f.vim'
	Plug 'bling/vim-bufferline'
	Plug 'somini/vim-autoclose'
	Plug 'mhinz/vim-startify'
	Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf'
  Plug 'jdkanani/vim-material-theme'
  Plug 'AndrewRadev/switch.vim'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'junegunn/vim-emoji'
  Plug 'mhinz/vim-signify'
  Plug 'jojoyuji/nerdtree-async'
  Plug 'leshill/vim-json'
  Plug 'elzr/vim-json' 
  Plug 'XadillaX/json-formatter.vim', {'for': 'json', 'do': 'npm install jjson -g'}
  Plug 'tpope/vim-jdaddy', {'for': 'json'}
  Plug 'zoubin/vim-gotofile'
  Plug 'tpope/vim-sensible'
  Plug 'prettier/vim-prettier', { 
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'json', 'vue', 'graphql']
    \ }
  Plug 'heavenshell/vim-jsdoc'
  Plug 'wellle/targets.vim'
  Plug 'mattn/emmet-vim'
  Plug 'posva/vim-vue'
  Plug 'ap/vim-css-color'
  Plug '29decibel/vim-stringify'
  Plug 'moll/vim-node', {'for': 'javascript'}
  Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
  Plug 'othree/yajs.vim', {'for': 'javascript'}
  Plug 'Quramy/vim-js-pretty-template', {'for': 'javascript'}
  Plug 'wakatime/vim-wakatime'
  Plug 'w0rp/ale'
  Plug 'matze/vim-move'
  Plug 'tpope/vim-unimpaired'
  Plug 'MattesGroeger/vim-bookmarks'

	""" Plugins' Settings {{{
    " NCM2
    autocmd BufEnter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect

    " JSDocs
    let g:jsdoc_enable_es6=1

    " UltiSnips
    let g:UltiSnipsUsePythonVersion = 3
    let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.".onhernandes/dotfiles/vim/snippets"]
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    " JS Libs
    let g:used_javascript_libs = 'underscore,vue,lodash,chai,jasmine'

    " VueJS
    let g:vue_disable_pre_processors = 1

    " Targets
    let g:targets_quotes = '"d ''q `'

    " Emmet
    let g:user_emmet_mode='a'

    " Switch
    let g:switch_mapping="-"
    let g:switch_custom_definitions =
      \ [
      \   ['true', 'false'],
      \   ['typeof', 'instanceof'],
      \   ['unshift', 'push'],
      \   ['log', 'error', 'debug', 'warn'],
      \   ['null', 'undefined', 'NaN'],
      \   ['map', 'forEach', 'filter'],
      \   ['let', 'const', 'var'],
      \   ['console.log', 'console.warn', 'console.error', 'debug'],
      \   ['log', 'warn', 'error'],
      \   ['before', 'after'],
      \   ['True', 'False', 'None'],
      \   ['get', 'put', 'post', 'delete'],
      \   ['exports', 'module.exports']
      \ ]

    " NerdTree
    let g:indent_guides_exclude_filetypes = ['nerdtree'] " fixes the folding issue on NERDTree
    let NERDTreeShowBookmarks=1
    let NERDTreeDirArrows=1
    let NERDTreeHijackNetrw=0

    autocmd VimEnter *
      \   if !argc()
      \ |   Startify
      \ |   NERDTree
      \ |   wincmd w
      \ | endif

    " Prettier
    let g:prettier#config#single_quote = 'true' 
    let g:prettier#config#tab_width = 2
    let g:prettier#config#use_tabs = 'false'
    let g:prettier#config#trailing_comma = 'none'
    let g:prettier#config#flatten_ternaries = 'true'
    nmap <leader>c <Plug>(Prettier)

    " Ale
    let g:ale_fixers = {'javascript': ['eslint', 'prettier']}
    let g:ale_linters_explicit = 1
    let g:ale_sign_warning = '!!'

    " Statusline
    let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

    " Signify
    let g:signify_sign_add = '+'
    let g:signify_sign_delete = '_'
    let g:signify_sign_delete_first_line = '‾'
    let g:signify_sign_change = '~'
    let g:signify_sign_changedelete = g:signify_sign_change

    " Nerdtree
    autocmd vimenter * NERDTree"

    " FZF Stuff
    command! -bang -nargs=* GitAg
      \ call fzf#vim#ag(<q-args>, {'dir': systemlist('git rev-parse --show-toplevel')[0]}, <bang>0)
  """ }}}
	call plug#end()
     
  " Theme & Syntax
  if !exists('g:syntax_on')
    syntax enable
  endif    
  set background=dark
  colorscheme material-theme
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
""" }}}

