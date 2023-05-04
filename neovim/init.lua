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
local tree_plugin = "nvim-tree"

if tree_plugin == "nvim-tree" then
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

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
    use 'nvim-tree/nvim-web-devicons'

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
      require = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
        -- Protected call to avoid errors on first run
        require("lualine").setup({
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
        })
      end
    }

    use 'stevearc/dressing.nvim'
    -- lsp-zero, that magic one which set up LSP, CMP and more
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
            pcall(vim.cmd, 'MasonUpdate')
          end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'FelipeLema/cmp-async-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'hrsh7th/cmp-nvim-lua'},
        {'L3MON4D3/LuaSnip'},     -- Required
        {'rafamadriz/friendly-snippets'},
        {'jose-elias-alvarez/typescript.nvim'},
        {'kevinhwang91/promise-async'},
        {'kevinhwang91/nvim-ufo'},
        {'stevearc/aerial.nvim'},
      },
      config = function ()
        -- New folding
        vim.opt.foldcolumn = '1'
        -- Using ufo provider need a large value, feel free to decrease the value
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
        vim.opt.foldenable = true
        -- Using ufo provider need remap `zR` and `zM`.
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeFoldsWith)
        nmap('zr', 'zR')
        nmap('zm', 'zM')

        vim.cmd([[
          set omnifunc=
        ]])
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function (_, bufnr)
          lsp.default_keymaps({buffer = bufnr})
        end)

        lsp.setup_servers({'rust_analyzer', 'sqlls'})
        lsp.skip_server_setup({'tsserver'})
        lsp.setup()

        require('luasnip.loaders.from_vscode').lazy_load({
          paths = {
            vim.fn.stdpath('config') .. '/snippets'
          }
        })

        local server_capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          }
        }

        -- vim.lsp.set_log_level("debug")
        require('typescript').setup({
          server = {
            capabilities = server_capabilities,
            cmd = { "typescript-language-server", "--stdio", "--log-level", "4" },
            init_options = {
              hostInfo = 'neovim',
              maxTsServerMemory = 4096,
            }
          }
        })
        require('ufo').setup()

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        local default_max_item_count = 5
        cmp.setup({
          sources = {
            {name = 'luasnip', keyword_length = 2, max_item_count = default_max_item_count},
            {name = 'nvim_lsp', max_item_count = default_max_item_count},
            {name = 'async-path', max_item_count = default_max_item_count},
            {name = 'buffer', keyword_length = 3, max_item_count = default_max_item_count},
          },
          mapping = {
            -- `Enter` key to confirm completion
            ['<CR>'] = cmp.mapping.confirm({select = false}),
            ['<Tab>'] = cmp_action.tab_complete(),
            ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
            -- Ctrl+Space to trigger completion menu
            ['<C-Space>'] = cmp.mapping.complete(),
            -- Navigate between snippet placeholder
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          },
        })

        vim.diagnostic.config({
          virtual_text = false
        })

        require('aerial').setup({
          on_attach = function (bufnr)
            vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
            vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
          end,
          backends = {"lsp"},
          filter_kind = false
        })
        nmap('<leader>ae', '<cmd>AerialToggle!<CR>')
      end
    }

    use {
      'folke/trouble.nvim',
      requires = "nvim-tree/nvim-web-devicons",
      ensure_installed = true,
      config = function ()
        require('trouble').setup({
          mode = 'document_diagnostics',
          indent_lines = false,
        })
      end
    }

    -- <leader>t opens magic select menu for TS
    local function magic_ts_code_actions()
      local code_actions = {
        ':TypescriptAddMissingImports',
        ':TypescriptOrganizeImports',
        ':TypescriptFixAll',
        ':Trouble document_diagnostics',
        ':Trouble references',
        'CodeAction Rename',
        'List CodeActions'
      }

      local function call_trouble_doc()
        require("trouble").toggle({ mode = 'document_diagnostics' })
      end

      local function call_trouble_references()
        require("trouble").toggle({ mode = 'lsp_references' })
      end

      local function call_rename_code_action()
        vim.lsp.buf.rename()
      end

      local function call_code_action_range()
        vim.lsp.buf.code_action()
      end

      local actions_by_cmd = {
        [':TypescriptAddMissingImports'] = require("typescript").actions.addMissingImports,
        [':TypescriptOrganizeImports'] = require("typescript").actions.organizeImports,
        [':TypescriptFixAll'] = require("typescript").actions.fixAll,
        [':Trouble document_diagnostics'] = call_trouble_doc,
        [':Trouble references'] = call_trouble_references,
        ['CodeAction Rename'] = call_rename_code_action,
        ['List CodeActions'] = call_code_action_range
      }

      local ui_select_opts = {
        prompt = 'Choose a code action: ',
      }

      local function on_choose_magic_action (action)
        local fn_action_name = actions_by_cmd[action]
        if fn_action_name then
          fn_action_name()
        end
      end

      vim.ui.select(code_actions, ui_select_opts, on_choose_magic_action)
    end

    _G.magic_ts_code_actions = magic_ts_code_actions
    vim.api.nvim_set_keymap('n', '<leader>t', ':lua magic_ts_code_actions()<CR>', { noremap = true })
    use {
      'akinsho/toggleterm.nvim',
      tag = '*',
      run = 'npm i -g commitizen cz-conventional-changelog',
      config = function ()
        require('toggleterm').setup()
        local Terminal = require("toggleterm.terminal").Terminal
        local git_cz = "git a && git cz"
        local git_commit = Terminal:new {
          cmd = git_cz,
          dir = "git_dir",
          close_on_exit = false,
          hidden = true,
          direction = "float",
          float_opts = {
            border = "double",
          },
          on_open = function(term)
            vim.cmd("startinsert!")
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", ":close<CR>", {noremap = true, silent = true})
          end,
        }
        _G.gitCz = function ()
          git_commit:toggle()
        end
        vim.cmd('command! GitCzTerm lua gitCz()')
      end
    }

    nmap('<leader>rs', ':source $MYVIMRC<CR>')

    use 'j-hui/fidget.nvim'
    require('fidget').setup{}

    -- Ale for async lint & fix with LSP support
    use 'dense-analysis/ale'
    vim.g.ale_sign_error = '✘'
    vim.g.ale_sign_warning = '▲'
    vim.g.ale_set_quickfix = 1
    vim.g.ale_completion_enabled = 1
    vim.g.ale_disable_lsp = 1
    vim.g.ale_virtualtext_cursor = 'disabled'
    local ale_fixers = {}
    local js_fixers = {'eslint'}
    ale_fixers['javascript'] = js_fixers
    ale_fixers['javascriptreact'] = js_fixers
    ale_fixers['typescript'] = js_fixers
    ale_fixers['typescriptreact'] = js_fixers
    ale_fixers['vue'] = js_fixers
    ale_fixers['css'] = {'csslint'}
    ale_fixers['sass'] = {'prettier'}
    ale_fixers['scss'] = ale_fixers['sass']
    ale_fixers['html'] = {'htmlhint'}
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
    nmap('<leader>ar', ':ALEFindReferences<CR>')

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate<CR>:TSInstall typescript javascript python',
      ft = {'typescript', 'typescriptreact', 'javascript', 'javascriptreact'},
      config = function ()
        require'nvim-treesitter.configs'.setup{
          highlight = {
            enable = true
          }
        }
      end
    }

    if tree_plugin == "nvim-tree" then
      use {
        'nvim-tree/nvim-tree.lua',
        require = {
          {'nvim-tree/nvim-web-devicons'}
        },
        config = function ()
          --require('nvim-tree/nvim-web-devicons').setup()
          local function on_attach(bufnr)
            local api = require('nvim-tree.api')
            local function opts(desc)
              return {
                desc = 'nvim-tree: ' .. desc,
                buffer = bufnr,
                noremap = true,
                silent = true,
                nowait = true
              }
            end

            api.config.mappings.default_on_attach(bufnr)
            vim.api.nvim_buf_set_keymap('n', 'b', api.node.navigate.parent_close, opts('Close Directory'))
          end

          require('nvim-tree').setup({})
        end
      }

      vim.api.nvim_set_keymap("n", "<leader>vf", ":NvimTreeFindFile<cr>", {silent = true, noremap = true})
      vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
    end

    if tree_plugin == "nerdtree" then
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
        autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
      ]])
    end

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
    use {
      'AndrewRadev/switch.vim',
      config = function ()
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
      end
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
    -- JSON Formatter: <leader>json
    use { 'XadillaX/json-formatter.vim', ft = 'json', run = 'npm install jjson -g' }
    -- Better JS Highlight
    use { 'othree/yajs.vim', ft = {'javascript', 'typescript'} }
    -- Support for ES.Next features
    use { 'othree/es.next.syntax.vim',  ft = {'javascript', 'typescript', 'typescriptreact'} }
    use { 'mlaursen/vim-react-snippets', ft = {'javascript', 'typescript'} }
    -- JSX Support for React
    use { 'MaxMEllon/vim-jsx-pretty', ft = {'javascript', 'jsx', 'typescript', 'tsx'} }
    -- Highlight JavaScript's Template Strings contents in other FileType syntax rule
    use { 'Quramy/vim-js-pretty-template', ft = {'javascript', 'typescript'} }
    -- Typescript
    use { 'leafgarland/typescript-vim', ft = {'typescript'} }
    -- tsx
    use { 'peitalin/vim-jsx-typescript', ft = {'typescriptreact'} }
    --Typescript
    use { 'HerringtonDarkholme/yats.vim', ft = 'typescript' }

    -- JSDocs
    use {
      'heavenshell/vim-jsdoc',
      ft = {'javascript', 'jsx', 'typescript', 'typescriptreact'},
      run = 'make install',
      config =function ()
        vim.g.jsdoc_enable_es6 = 1
      end
    }

    -- JS Libs support
    -- NodeJS
    use { 'moll/vim-node', ft = {'javascript', 'typescript'} }

    -- HTML, CSS & Front-end related stuff
    use { 'ap/vim-css-color', ft = {'css', 'scss', 'sass', 'typescriptreact'} }

    -- Emmet
    use {
      'mattn/emmet-vim',
      ft = { 'vue', 'scss', 'sass', 'css', 'html', 'php', 'typescriptreact', 'jsx', 'tsx' },
      config = function ()
        vim.g.user_emmet_mode = 'a'
        vim.api.nvim_create_autocmd(
          { 'BufRead', 'BufNewFile' },
          { pattern = { '.tsx', '.vue', '.jsx', '.html', '.css', '.scss', '.sass' }, command = ':PackerLoad emmet-vim<CR>:EmmetInstall<CR>' }
        )
      end
    }

    -- VueJS
    use { 'posva/vim-vue', ft = {'vue'} }
    vim.g.vue_disable_pre_processors = 1

    -- TOML support
    use { 'cespare/vim-toml', ft = 'toml' }

    -- Lua better syntax highlight
    use { 'euclidianAce/BetterLua.vim', ft = 'lua' }

    -- Themes
    local theme_name = 'hachy/eva01.vim'
    use {
      theme_name
    }

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
