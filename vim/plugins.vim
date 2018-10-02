call plug#begin('~/.local/share/nvim/plugged')

""" NeoVim Completion Manager {{{
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-tmux'
  Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-vim'
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'ncm2/ncm2-markdown-subscope'

  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
""" }}}

""" Snippets {{{
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " UltiSnips
  let g:UltiSnipsUsePythonVersion = 3
  let g:UltiSnipsSnippetDirectories=["UltiSnips", expand("$HOME/.onhernandes/dotfiles/vim/snippets")]
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
""" }}}

""" Miscellaneous and Utils {{{ 
  Plug 'tpope/vim-surround'
  Plug 'rhysd/clever-f.vim'
  Plug 'bling/vim-bufferline'
  Plug 'somini/vim-autoclose'
  Plug 'mhinz/vim-startify'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'junegunn/vim-emoji'
  Plug 'tpope/vim-sensible'
  Plug 'wakatime/vim-wakatime'
  Plug 'matze/vim-move'
  Plug 'tpope/vim-unimpaired'
  Plug 'Chiel92/vim-autoformat'
  Plug 'jiangmiao/auto-pairs'
  Plug 'MattesGroeger/vim-bookmarks'

  " Lightline/Statusline
  Plug 'itchyny/lightline.vim'
  let g:lightline = {
    \ 'colorscheme': 'one',
    \ }

  " Signify
  Plug 'mhinz/vim-signify'
  let g:signify_sign_add = '+'
  let g:signify_sign_delete = '_'
  let g:signify_sign_delete_first_line = '‾'
  let g:signify_sign_change = '~'
  let g:signify_sign_changedelete = g:signify_sign_change

  " Ale
  Plug 'w0rp/ale'
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '▲'
  let g:ale_set_quickfix = 1
  let g:ale_open_list = 1
  nnoremap <leader>af :ALEFix<CR>
  nnoremap <leader>al :ALELint<CR>

  " NerdTree
  Plug 'jojoyuji/nerdtree-async'
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

  " Targets
  Plug 'wellle/targets.vim'
  let g:targets_quotes = '"d ''q `'

  " Switch
  Plug 'AndrewRadev/switch.vim'
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
""" }}}

""" Files {{{ 
  Plug 'zoubin/vim-gotofile'

  " FZF Stuff
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf'
  command! -bang -nargs=* GitAg
    \ call fzf#vim#ag(<q-args>, {'dir': systemlist('git rev-parse --show-toplevel')[0]}, <bang>0)
""" }}}

""" Themes and Colors {{{ 
  Plug 'jdkanani/vim-material-theme'
   
  " Theme & Syntax
  if !exists('g:syntax_on')
    syntax enable
  endif    

  set background=dark
  colorscheme material-theme
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
""" }}}

""" JavaScript/JSON {{{ 
  Plug 'leshill/vim-json'
  Plug 'elzr/vim-json' 
  Plug 'XadillaX/json-formatter.vim', {'for': 'json', 'do': 'npm install jjson -g'}
  Plug 'tpope/vim-jdaddy', {'for': 'json'}
  Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
  Plug 'othree/yajs.vim', {'for': 'javascript'}
  Plug 'Quramy/vim-js-pretty-template', {'for': 'javascript'}

  " JSDocs
  Plug 'heavenshell/vim-jsdoc'
  let g:jsdoc_enable_es6=1

  " JS Libs
  let g:used_javascript_libs = 'vue,lodash'

  " NodeJS
  Plug 'moll/vim-node', {'for': 'javascript'}
""" }}}

""" HTML/CSS/FrontEnd Stuff {{{
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-liquid'
  Plug 'mustache/vim-mustache-handlebars'

  " Emmet
  Plug 'mattn/emmet-vim'
  let g:user_emmet_mode='a'

  " VueJS
  Plug 'posva/vim-vue', { 'for': 'vue' }
  let g:vue_disable_pre_processors = 1
""" }}}

if filereadable(expand("$HOME/.onhernandes/dotfiles/vim/local/plugins.vim"))
  so $HOME/.onhernandes/dotfiles/vim/local/plugins.vim
endif

call plug#end()
