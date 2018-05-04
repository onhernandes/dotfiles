""" Automatically create needed files and folders on first run (*nix only) {{{
	call system('mkdir -p $HOME/.vim/{autoload,bundle,swap,undo}')
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
	nmap <leader>so :so ~/.vimrc<cr> 
	nmap <leader>rr :edit ~/.onhernandes/dotfiles/vimrc<cr>

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
	Plug 'shime/vim-livedown'
	Plug 'honza/vim-snippets'
	Plug 'ervandew/supertab'
	Plug 'bling/vim-bufferline'
	Plug 'somini/vim-autoclose'
	Plug 'mhinz/vim-startify'
	Plug 'neomake/neomake'
	Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'mbbill/undotree'
  Plug 'junegunn/fzf'
  Plug 'jdkanani/vim-material-theme'
  Plug 'AndrewRadev/switch.vim'
  Plug 'stefandtw/quickfix-reflector.vim'

	" Plugins' Settings
	
  " UltiSnips
	let g:UltiSnipsUsePythonVersion = 2
	let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.".onhernandes/dotfiles/vim-snippets"]
	let g:UltiSnipsEditSplit="vertical"
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

  " Switch
  let g:switch_mapping="-"
  let g:switch_custom_definitions =
    \ [
    \   ['true', 'false'],
    \   ['map', 'forEach']
    \ ]

	call plug#end()
""" }}}

""" Vim settings after plug install {{{
	" https://stackoverflow.com/a/33380495/1076493
	if !exists('g:syntax_on')
		syntax enable
	endif

  " Neomake
  call neomake#configure#automake('nrwi')
    
	set background=dark
  colorscheme material-theme
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  """ Force behavior and filetypes, and by extension highlighting {{{
	  augroup FileTypeRules
	 		autocmd!
	 		autocmd BufNewFile,BufRead *.md set ft=markdown tw=79
	 		autocmd BufNewFile,BufRead *.tex set ft=tex tw=79
	 		autocmd BufNewFile,BufRead *.txt set ft=sh tw=79
	 	augroup END
	""" }}}
""" }}}

