HOME = os.getenv("HOME")

local packer_packages_path = vim.fn.stdpath('data') .. '/site/pack/packer/start'
-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = packer_packages_path .. '/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Vim settings {{{
  -- General settings
  vim.g.mapleader = " " -- map leader to space
  vim.opt.encoding = "UTF-8" -- encoding
  vim.opt.swapfile = false -- don't use swap files

  -- White characters
  vim.opt.autoindent = true
  vim.opt.smartindent = true
  vim.opt.cindent = true
  vim.opt.tabstop = 2 -- 1 tab = 2 spaces
  vim.opt.shiftwidth = 2 -- indentation rule
  vim.opt.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word, experimental
  vim.opt.expandtab = true -- expand tab to spaces

  -- Display
  vim.opt.scrolloff = 3 -- always show 3 rows from edge of the screen
  vim.opt.laststatus = 2 -- always show status line

  -- Experimental Display settings
  vim.opt.showmatch  = true -- show matching brackets, experimental
  vim.opt.synmaxcol = 500 -- stop syntax highlight after x lines for performance, experimental
  vim.opt.wrap = true -- wrap lines, experimental
  vim.opt.eol = false -- show if there's no eol char, experimental
  vim.opt.showbreak= '↪' -- character to show when line is broken, experimental

  -- Sidebar
  vim.opt.number = true -- line number on the left
  vim.opt.numberwidth = 4 -- always reserve 4 spaces for line number
  vim.opt.showcmd = true -- display command in bottom bar
  -- vim.opt.signcolumn = 'yes' -- keep 1 column for coc.vim  check
  vim.opt.modelines = 0

  -- Windows
  vim.opt.splitright = true -- set to split new window to right of current one
  vim.opt.splitbelow = true -- set to split new window to under current one
  vim.opt.title = true -- when on, the title of the window will be set to the value o titlestring

  -- Folding
  vim.opt.foldenable = true
  vim.opt.foldlevelstart = 2
  vim.opt.foldlevel = 2 -- limit folding to 2 levels, experimental
  vim.opt.foldnestmax = 10
  vim.opt.foldmethod = 'indent' -- use indentation to generate folds
  --vim.opt.foldmethod = 'syntax' -- use language syntax to generate folds, experimental

  -- Misc
  vim.opt.virtualedit = "all" -- allow to virtually edit chars where they don't exist
  vim.opt.clipboard = "unnamedplus" -- syncs nvim clipboard & system clipboard
  vim.opt.more = true -- keep loading lists
  vim.opt.showmode = false
  vim.opt.completeopt = "menu,preview,longest" -- list of options for Insert mode completion
  vim.opt.expandtab = true
  vim.opt.termguicolors = true
  vim.opt.pastetoggle = '<F6>'

  -- Wildmode/wildmenu command-line completion
  vim.opt.wildmenu = true -- on TAB autocomplete command options
  vim.opt.wildignore = '*.bak,*.swp,*.swo,*.a,*.o,*.so,*.pyc,*.class,*.jpg,*.jpeg,*.gif,*.png,*.pdf,*/.git*,*.tar,*.zip,*node_modules/*,*dist/*,*public/*,coverage,*/__pycache__/*'
  vim.opt.wildmode = 'longest:full,list:full'

  -- Return to last edit position when opening files
  vim.cmd([[
    augroup LastPosition
      autocmd! BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal! g`\"" |
        \ endif
    augroup END
  ]])
-- }}}


--- Vim mappings {{{
  function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
  end

  function nmap(shortcut, command)
    map('n', shortcut, command)
  end

  function imap(shortcut, command)
    map('i', shortcut, command)
  end

  function vmap(shortcut, command)
    map('v', shortcut, command)
  end

  function cmap(shortcut, command)
    map('c', shortcut, command)
  end

  function tmap(shortcut, command)
    map('t', shortcut, command)
  end

  -- Move through windows easily
  --nmap('<c-h>', '<c-w>h')
  --nmap('<c-l>', '<c-w>l')
  --nmap('<c-j>', '<c-w>j')
  --nmap('<c-k>', '<c-w>k')

  -- Map leader + q to close current buffer
  vim.cmd([[
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
  ]])
  nmap('<leader>q', '<esc>:call CloseCurrentBuffer()<cr>')

  -- Map moving-keys for sugestions/completions in insert-mode
  imap('<c-k>', '<c-p>')
  imap('<c-j>', '<c-n>')

  -- Map ; to : in normal and visual mode
  nmap(';', ':')
  vmap(';', ':')

  -- Map reload and edit for init.lua
  --nmap('<leader>so', ':so $DOTFILES/neovim/init.lua<cr>');
  nmap('<leader>rr', ':edit $DOTFILES/neovim/init.lua<cr>');

  -- Map :Files as Find Files
  nmap('<leader>ff', ':Files ./<cr>')

  -- Map :Ag as Find Code
  nmap('<leader>fc', ':Ag <cr>')

  -- Bubble single lines to CTRL + ALT + j
  nmap('<c-a-j>', ']e')
  nmap('<c-a-k>', '[e')

  -- Bubble multiple lines to CTRL + ALT + j
  vmap('<c-a-j>', ']egv')
  vmap('<c-a-k>', '[egv')

  -- leader + space clear highlight
  nmap('<leader><space>', ':silent noh<cr>')

  -- Simpler folding
  nmap('zr', 'zR')
  nmap('zm', 'zM')

  -- Make the fold that we're currently in the only fold showing; 
  -- collapse all other folds. Mnemonic: "z This"
  nmap('zt', 'zMzvzczO')

  -- jj to <esc>
  imap('jj', '<esc>')

  -- <tab> indent
  vmap('<tab>', '>gv')
  vmap('<s-tab>', '<gv')
  nmap('<tab>', '>>')
  nmap('<s-tab>', '<<')

  -- Map leader save
  nmap('<leader>w', ':w!<cr>')

  -- Map next and previous buffer
  nmap('<leader>l', ':bn<cr>')
  nmap('<leader>h', ':bp<cr>')

  -- Map resize horizontal splits
  nmap('<leader>j', ':res -1<cr>')
  nmap('<leader>k', ':res +1<cr>')
  nmap('<c-h>', '<c-w>h')

  -- Map :Buffers
  nmap('<leader>b', ':Buffers<cr>')

  -- Map horizontal and vertical split of the same file
  nmap('<leader>s', ':split %<cr>')
  nmap('<leader>vs', ':vsplit %<cr>')

  -- Map S to s for surround plugin
  vmap('s', 'S')

  -- Abbreviations
  vim.cmd([[
    iabbrev lenght length
    iabbrev widht width
    iabbrev assing assign
  ]])
--}}}

-- Vim plugins using packer {{{
  -- Use a protected call so we don't error out on first use
  local status_ok, packer = pcall(require, "packer")
  if not status_ok then
    return
  end

  -- Have packer use a popup window
  packer.init({
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  })

  packer.startup(function (use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Misc
    use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of plugins
    use 'tpope/vim-surround'
    use 'tpope/vim-dispatch'
    use 'rhysd/clever-f.vim'
    use 'bling/vim-bufferline'
    use 'somini/vim-autoclose'
    use 'mhinz/vim-startify'
    use 'stefandtw/quickfix-reflector.vim'
    use 'tpope/vim-sensible'
    use 'wakatime/vim-wakatime'
    use 'matze/vim-move'
    use 'tpope/vim-unimpaired'
    use 'jiangmiao/auto-pairs'
    use 'mileszs/ack.vim'

    -- Completion suggestion
    use 'roxma/nvim-yarp'

    -- Snippets
    use 'SirVer/ultisnips'
    vim.g.UltiSnipsUsePythonVersion = 3
    vim.g.UltiSnipsEditSplit = 'vertical'
    vim.g.UltiSnipsExpandTrigger = '<tab>'
    vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
    vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'

    use { 'honza/vim-snippets', run = 'rm ./UltiSnips/javascript* && rm -rf ./snippets/javascript*' }
    local ultisnips_javascript = {}
    ultisnips_javascript['keyword-spacing'] = 'always';
    ultisnips_javascript['semi'] = 'never';
    ultisnips_javascript['space-before-function-paren'] = 'always';
    vim.g.ultisnips_javascript = ultisnips_javascript

    -- Bookmarks
    use 'MattesGroeger/vim-bookmarks'
    vim.g.bookmark_no_default_key_mappings = 1
    vim.cmd([[
      function! BookmarkMapKeys()
        nmap mm :BookmarkToggle<CR>
        nmap mi :BookmarkAnnotate<CR>
        nmap mn :BookmarkNext<CR>
        nmap mp :BookmarkPrev<CR>
        nmap ma :BookmarkShowAll<CR>
        nmap mc :BookmarkClear<CR>
        nmap mx :BookmarkClearAll<CR>
        nmap mkk :BookmarkMoveUp
        nmap mjj :BookmarkMoveDown
      endfunction
      function! BookmarkUnmapKeys()
        unmap mm
        unmap mi
        unmap mn
        unmap mp
        unmap ma
        unmap mc
        unmap mx
        unmap mkk
        unmap mjj
      endfunction
      autocmd BufEnter * :call BookmarkMapKeys()
      autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
    ]])

    -- Signify
    use 'mhinz/vim-signify'
    vim.g.signify_sign_add = '+'
    vim.g.signify_sign_delete = '_'
    vim.g.signify_sign_delete_first_line = '‾'
    vim.g.signify_sign_change = '~'
    vim.g.signify_sign_changedelete = '~'

    -- Statusline
    -- Vim was itchyny/lightline.vim
    -- and colorscheme was 'one'
    use {
      'nvim-lualine/lualine.nvim',
      require = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Protected call to avoid errors on first run
    local status_lualine_ok, lualine = pcall(require, "lualine")
    if status_lualine_ok then
      lualine.setup {
        options = {
          icons_enabled = true,
          theme = 'material'
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        }
      }
    end

    -- Ale for async lint & fix with LSP support
    use 'dense-analysis/ale'
    vim.g.ale_sign_error = '✘'
    vim.g.ale_sign_warning = '▲'
    vim.g.ale_set_quickfix = 1
    vim.g.ale_completion_enabled = 1
    local ale_fixers = {}
    ale_fixers['javascript'] = {'eslint', 'prettier'}
    ale_fixers['typescript'] = {'eslint', 'prettier'}
    ale_fixers['typescriptreact'] = {'eslint', 'prettier'}
    ale_fixers['vue'] = {'eslint', 'prettier'}
    ale_fixers['python'] = {'black'}
    -- ale_fixers['go'] = {'gofmt', 'goimports'}
    vim.g.ale_fixers = ale_fixers

    local ale_linters = {}
    ale_linters['javascript'] = {'eslint', 'flow-language-server'}
    ale_linters['typescript'] = {'eslint'}
    ale_linters['vue'] = {'eslint'}
    ale_linters['python'] = {'flake8'}
    vim.g.ale_linters = ale_linters

    nmap('<leader>af', ':ALEFix<CR>')
    nmap('<leader>al', ':ALELint<CR>')

    -- Auto completion with CoQ
    --[[ coq
    use { 'ms-jpq/coq_nvim', branch = 'coq', run = 'pip install virtualenv' }
    vim.g.coq_settings = {
      auto_start = true,
      keymap = {
        manual_complete = '',
        recommended = false
      },
      ['display.pum.fast_close'] = false
    }
    
    coq --]]
    --use { 'ms-jpq/coq.thirdparty', branch = '3p' }
    -- use { 'onhernandes/custom-coq-snippets', run = function() vim.fn.system({ 'ln', '-s', packer_packages_path .. '/custom-coq-snippets/snippets', os.getenv('DOTFILES') .. '/neovim/coq-user-snippets' }) vim.cmd([[ :COQsnips compile ]]) end }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate<CR>:TSInstall typescript javascript rust scss python sql css html vim json jsdoc graphql gitignore dockerfile c'
    }
    require'nvim-treesitter.configs'.setup{
      highlight = {
        enable = true
      }
    }

    -- This is experimental
    vim.cmd([[
      set foldmethod=expr
      set foldexpr=nvim_treesitter#foldexpr()
    ]])

    -- LSP Config
    use { 'neovim/nvim-lspconfig' }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    vim.o.completeopt= 'menu,menuone,noselect'

    -- Snippets
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    -- nvim-cmp
    local cmp = require'cmp'

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      })
    })
    -- use 'sigmasd/deno-nvim'
    use 'jose-elias-alvarez/typescript.nvim'
    require("typescript").setup({
      disable_commands = false,
      server = { capabilities = capabilities }
    })
    nmap('gt', ':TypescriptGoToSourceDefinition<cr>')

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('lspconfig')['pyright'].setup({ capabilities = capabilities })
    -- require('lspconfig')['deno-nvim'].setup(require('coq').lsp_ensure_capabilities())
    if vim.fn.exists('$HOME/.local/bin/rust-analyzer') then
      require('lspconfig')['rust_analyzer'].setup({ capabilities = capabilities })
    end

    use 'preservim/nerdtree'
    use 'ivalkeen/nerdtree-execute'
    use 'tyok/nerdtree-ack'
    vim.g.indent_guides_exclude_filetypes = {'nerdtree'} -- fixes the folding issue on NERDTree
    vim.g.NERDTreeShowBookmarks=1
    vim.g.NERDTreeDirArrows=1
    vim.g.NERDTreeGlyphReadOnly = 'RO'
    nmap('<leader>v', '<cmd>NERDTreeToggle<cr>')
    nmap('<leader>vf', ':NERDTreeFind<cr>')
    vim.cmd([[
      autocmd VimEnter *
        \   if !argc()
        \ |   Startify
        \ |   wincmd w
        \ | endif
    ]])

    -- Targets
    use 'wellle/targets.vim'
    vim.g.targets_quotes = '"d \'q `'

    -- Switch
    use 'AndrewRadev/switch.vim'
    vim.g.switch_mapping = '-'
    vim.g.switch_custom_definitions = {
      {'true', 'false'},
      {'typeof', 'instanceof'},
      {'unshift', 'push', 'shift'},
      {'log', 'error', 'debug', 'warn'},
      {'null', 'undefined', 'NaN'},
      {'map', 'forEach', 'filter', 'reduce'},
      {'let', 'const', 'var'},
      {'console.log', 'console.warn', 'console.error'},
      {'log', 'warn', 'error'},
      {'before', 'after'},
      {'True', 'False', 'None'},
      {'get', 'put', 'post', 'delete'},
      {'exports', 'module.exports'},
      {'right', 'left'},
      {'top', 'bottom'}
    }

    -- Files
    use { 'zoubin/vim-gotofile', ft = {'javascript', 'typescript', 'jsx', 'tsx', 'json'} }

    -- FZF Stuff
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim'
    vim.cmd([[
      command! -bang -nargs=* GitAg
        \ call fzf#vim#ag(<q-args>, {'dir': systemlist('git rev-parse --show-toplevel')[0]}, <bang>0)
    ]])
    
    -- Vim JSON support
    use { 'leshill/vim-json', as = 'leshill-vim-json', ft = 'json' }
    -- Syntax Highlight key and value
    -- use { 'elzr/vim-json', as = 'elzr-vim-json', ft = 'json' }
    -- JSON Formatter: <leader>json
    use { 'XadillaX/json-formatter.vim', ft = 'json', run = 'npm install jjson -g' }
    -- Better JS Highlight
    use { 'othree/yajs.vim', ft = {'javascript', 'typescript'} }
    -- Support for ES.Next features
    use { 'othree/es.next.syntax.vim',  ft = {'javascript', 'typescript', 'typescriptreact'} }
    -- JSX Support for React
    use { 'MaxMEllon/vim-jsx-pretty', ft = {'javascript', 'jsx', 'typescript', 'tsx'} }
    -- Highlight JavaScript's Template Strings contents in other FileType syntax rule
    use { 'Quramy/vim-js-pretty-template', ft = {'javascript', 'typescript'} }
    -- Typescript
    use { 'leafgarland/typescript-vim', ft = 'typescript' }
    --Typescript
    use { 'HerringtonDarkholme/yats.vim', ft = 'typescript' }

    -- JSDocs
    use { 'heavenshell/vim-jsdoc', ft = 'javascript', run = 'make install' }
    vim.g.jsdoc_enable_es6 = 1

    -- JS Libs support
    --use 'othree/javascript-libraries-syntax.vim'
    --let g:used_javascript_libs = 'vue,lodash'

    -- NodeJS
    use { 'moll/vim-node', ft = {'javascript', 'typescript'} }

    -- HTML, CSS & Front-end related stuff
    use { 'ap/vim-css-color', ft = {'css', 'scss', 'sass'} }

    -- Emmet
    use { 'mattn/emmet-vim', ft = { 'vue', 'scss', 'sass', 'css', 'html', 'php', 'typescriptreact', 'jsx', 'tsx' } }
    vim.g.user_emmet_mode = 'a'
    vim.api.nvim_create_autocmd(
      --{ "FileType" },
      { 'BufRead', 'BufNewFile' },
      { pattern = { '.tsx', '.vue', '.jsx', '.html', '.css', '.scss', '.sass' }, command = ':PackerLoad emmet-vim<CR>:EmmetInstall<CR>' }
    )

    -- VueJS
    use { 'posva/vim-vue', ft = {'vue'} }
    vim.g.vue_disable_pre_processors = 1

    -- TOML support
    use { 'cespare/vim-toml', ft = 'toml' }

    -- Lua better syntax highlight
    use { 'euclidianAce/BetterLua.vim', ft = 'lua' }

    -- Themes
    --  use 'joshdick/onedark.vim'
    local thema_name = 'hachy/eva01.vim'
    use {thema_name}

    vim.cmd([[
      if !exists('g:syntax_on')
        syntax enable
      endif    

      set background = "dark"
      colorscheme eva01
    ]])

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)
-- }}}
