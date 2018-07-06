""" Automatically create needed files and folders on first run (*nix only) {{{
	call system('mkdir -p $HOME/.vim/{autoload,bundle,swap,undo}')
  call system('mkdir $HOME/.local/share/nvim/plugged')
""" }}}

""" Neo/Vim Settings {{{
	" Set tabs to 2 spaces
	set tabstop=2
	set softtabstop=0
	set shiftwidth=2

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

  " Map leader save
	nmap <leader>w :w!<cr>

  " Map next and previous buffer
	nmap <leader>l :bn<cr>
	nmap <leader>h :bp<cr>

  " Map :Buffers
  nnoremap <leader>b :Buffers<cr>

	" Map horizontal and vertical split of the same file
	nmap <leader>s :split %<cr>
	nmap <leader>vs :vsplit %<cr>

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
	Plug 'roxma/nvim-completion-manager'
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

	""" Plugins' Settings {{{
    " JSDocs
    g:jsdoc_enable_es6=1

    " UltiSnips
    if has('python3')
      let g:UltiSnipsUsePythonVersion = 3
    else
      let g:UltiSnipsUsePythonVersion = 2
    endif
    let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.".onhernandes/dotfiles/vim-snippets"]
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

    " Statusline
    let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
  """ }}}

    " Signify
    let g:signify_sign_add = '+'
    let g:signify_sign_delete = '_'
    let g:signify_sign_delete_first_line = '‾'
    let g:signify_sign_change = '~'
    let g:signify_sign_changedelete = g:signify_sign_change

    " Nerdtree
    autocmd vimenter * NERDTree"
	call plug#end()
     
  " Theme & Syntax
  if !exists('g:syntax_on')
    syntax enable
  endif    
  set background=dark
  colorscheme material-theme
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
""" }}}

