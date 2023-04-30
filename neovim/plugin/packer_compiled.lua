-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/hernandes/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/hernandes/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/hernandes/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/hernandes/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hernandes/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/BetterLua.vim",
    url = "https://github.com/euclidianAce/BetterLua.vim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["ack.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/ack.vim",
    url = "https://github.com/mileszs/ack.vim"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ale = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["cmp-async-path"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/cmp-async-path",
    url = "https://github.com/FelipeLema/cmp-async-path"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\nÍ\1\0\0\5\0\n\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0005\2\6\0005\3\b\0005\4\a\0=\4\t\3B\0\3\1K\0\1\0\fpattern\1\0\1\fcommand/:PackerLoad emmet-vim<CR>:EmmetInstall<CR>\1\b\0\0\t.tsx\t.vue\t.jsx\n.html\t.css\n.scss\n.sass\1\3\0\0\fBufRead\15BufNewFile\24nvim_create_autocmd\bapi\6a\20user_emmet_mode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["es.next.syntax.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/es.next.syntax.vim",
    url = "https://github.com/othree/es.next.syntax.vim"
  },
  ["eva01.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/eva01.vim",
    url = "https://github.com/hachy/eva01.vim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["json-formatter.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/json-formatter.vim",
    url = "https://github.com/XadillaX/json-formatter.vim"
  },
  ["leshill-vim-json"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/leshill-vim-json",
    url = "https://github.com/leshill/vim-json"
  },
  ["lsp-zero.nvim"] = {
    config = { "\27LJ\2\n;\0\2\5\1\3\0\6-\2\0\0009\2\0\0025\4\1\0=\1\2\4B\2\2\1K\0\1\0\0¿\vbuffer\1\0\0\20default_keymapsù\1\0\1\a\0\v\0\0196\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\4\0'\5\5\0005\6\6\0=\0\a\6B\1\5\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\b\0'\5\t\0005\6\n\0=\0\a\6B\1\5\1K\0\1\0\1\0\0\24<cmd>AerialNext<CR>\6}\vbuffer\1\0\0\24<cmd>AerialPrev<CR>\6{\6n\bset\vkeymap\bvimê\f\1\0\f\0R\0Æ\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1c\0=\1\4\0006\0\0\0009\0\1\0)\1c\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0006\4\v\0'\6\f\0B\4\2\0029\4\r\4B\0\4\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\14\0006\4\v\0'\6\f\0B\4\2\0029\4\15\4B\0\4\0016\0\16\0'\2\17\0'\3\n\0B\0\3\0016\0\16\0'\2\18\0'\3\14\0B\0\3\0016\0\v\0'\2\19\0B\0\2\0029\0\20\0004\2\0\0B\0\2\0029\1\21\0003\3\22\0B\1\2\0019\1\23\0005\3\24\0B\1\2\0019\1\25\0005\3\26\0B\1\2\0019\1\27\0B\1\1\0016\1\v\0'\3\28\0B\1\2\0029\1\29\0015\3\"\0004\4\3\0006\5\0\0009\5\30\0059\5\31\5'\a \0B\5\2\2'\6!\0&\5\6\5>\5\1\4=\4#\3B\1\2\0015\1'\0005\2%\0005\3$\0=\3&\2=\2(\0016\2\v\0'\4)\0B\2\2\0029\2\27\0025\4,\0005\5*\0=\1+\5=\5-\4B\2\2\0016\2\v\0'\4\f\0B\2\2\0029\2\27\2B\2\1\0016\2\v\0'\4.\0B\2\2\0029\2/\0029\2\27\0029\0040\0B\4\1\0A\2\0\0016\2\v\0'\0041\0B\2\2\0026\3\v\0'\5\19\0B\3\2\0029\0032\3B\3\1\2)\4\5\0009\5\27\0025\a8\0004\b\5\0005\t3\0=\0044\t>\t\1\b5\t5\0=\0044\t>\t\2\b5\t6\0=\0044\t>\t\3\b5\t7\0=\0044\t>\t\4\b=\b9\a5\b=\0009\t:\0029\t;\t5\v<\0B\t\2\2=\t>\b9\t?\3B\t\1\2=\t@\b9\tA\3B\t\1\2=\tB\b9\t:\0029\tC\tB\t\1\2=\tD\b9\tE\3B\t\1\2=\tF\b9\tG\3B\t\1\2=\tH\b=\b:\aB\5\2\0016\5\0\0009\5I\0059\5 \0055\aJ\0B\5\2\0016\5\v\0'\aK\0B\5\2\0029\5\27\0055\aM\0003\bL\0=\b\21\a5\bN\0=\bO\aB\5\2\0016\5\16\0'\aP\0'\bQ\0B\5\3\0012\0\0ÄK\0\1\0\27<cmd>AerialToggle!<CR>\15<leader>ae\rbackends\1\2\0\0\blsp\1\0\1\16filter_kind\1\0\vaerial\1\0\1\17virtual_text\1\15diagnostic\n<C-b>\26luasnip_jump_backward\n<C-f>\25luasnip_jump_forward\14<C-Space>\rcomplete\f<S-Tab>\28select_prev_or_fallback\n<Tab>\17tab_complete\t<CR>\1\0\0\1\0\1\vselect\1\fconfirm\fmapping\fsources\1\0\0\1\0\2\19keyword_length\3\3\tname\vbuffer\1\0\1\tname\15async-path\1\0\1\tname\rnvim_lsp\19max_item_count\1\0\2\19keyword_length\3\2\tname\fluasnip\15cmp_action\bcmp\16nvim_lua_ls\vlua_ls\14lspconfig\vserver\1\0\0\17capabilities\1\0\0\15typescript\17textDocument\1\0\0\17foldingRange\1\0\0\1\0\2\20lineFoldingOnly\2\24dynamicRegistration\1\npaths\1\0\0\14/snippets\vconfig\fstdpath\afn\14lazy_load luasnip.loaders.from_vscode\nsetup\1\2\0\0\rtsserver\22skip_server_setup\1\3\0\0\18rust_analyzer\nsqlls\18setup_servers\0\14on_attach\vpreset\rlsp-zero\azm\azr\tnmap\19closeFoldsWith\azM\17openAllFolds\bufo\frequire\azR\6n\bset\vkeymap\15foldenable\19foldlevelstart\14foldlevel\0061\15foldcolumn\bopt\bvim\0" },
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nœ\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\2\ntheme\rmaterial\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n]\0\1\4\1\4\0\b5\1\1\0'\2\0\0\18\3\0\0&\2\3\2=\2\2\1-\2\0\0=\2\3\1L\1\2\0\0¿\vbuffer\tdesc\1\0\3\vnowait\2\fnoremap\2\vsilent\2\16nvim-tree: Á\1\1\1\v\0\15\0\0236\1\0\0'\3\1\0B\1\2\0023\2\2\0009\3\3\0019\3\4\0039\3\5\3\18\5\0\0B\3\2\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0009\a\v\0019\a\f\a9\a\r\a\18\b\2\0'\n\14\0B\b\2\0A\3\3\0012\0\0ÄK\0\1\0\20Close Directory\17parent_close\rnavigate\tnode\6b\6n\24nvim_buf_set_keymap\bapi\bvim\22default_on_attach\rmappings\vconfig\0\18nvim-tree.api\frequire@\1\0\4\0\4\0\b3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0014\3\0\0B\1\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0\0" },
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\ni\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nvim-yarp",
    url = "https://github.com/roxma/nvim-yarp"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["quickfix-reflector.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/quickfix-reflector.vim",
    url = "https://github.com/stefandtw/quickfix-reflector.vim"
  },
  ["switch.vim"] = {
    config = { "\27LJ\2\n§\4\0\0\3\0\20\0'6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0004\1\16\0005\2\5\0>\2\1\0015\2\6\0>\2\2\0015\2\a\0>\2\3\0015\2\b\0>\2\4\0015\2\t\0>\2\5\0015\2\n\0>\2\6\0015\2\v\0>\2\a\0015\2\f\0>\2\b\0015\2\r\0>\2\t\0015\2\14\0>\2\n\0015\2\15\0>\2\v\0015\2\16\0>\2\f\0015\2\17\0>\2\r\0015\2\18\0>\2\14\0015\2\19\0>\2\15\1=\1\4\0K\0\1\0\1\3\0\0\btop\vbottom\1\3\0\0\nright\tleft\1\3\0\0\fexports\19module.exports\1\5\0\0\bget\bput\tpost\vdelete\1\4\0\0\tTrue\nFalse\tNone\1\3\0\0\vbefore\nafter\1\4\0\0\blog\twarn\nerror\1\4\0\0\16console.log\17console.warn\18console.error\1\4\0\0\blet\nconst\bvar\1\5\0\0\bmap\fforEach\vfilter\vreduce\1\4\0\0\tnull\14undefined\bNaN\1\5\0\0\blog\nerror\ndebug\twarn\1\4\0\0\funshift\tpush\nshift\1\3\0\0\vtypeof\15instanceof\1\3\0\0\ttrue\nfalse\30switch_custom_definitions\6-\19switch_mapping\6g\bvim\0" },
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/switch.vim",
    url = "https://github.com/AndrewRadev/switch.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nï\1\0\1\b\0\n\0\0146\1\0\0009\1\1\1'\3\2\0B\1\2\0016\1\0\0009\1\3\0019\1\4\0019\3\5\0'\4\6\0'\5\a\0'\6\b\0005\a\t\0B\1\6\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\15:close<CR>\6q\6n\nbufnr\24nvim_buf_set_keymap\bapi\17startinsert!\bcmd\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\2¿\vtoggleÕ\2\1\0\a\0\18\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\1\5\0\18\4\0\0009\2\6\0005\5\a\0=\1\b\0055\6\t\0=\6\n\0053\6\v\0=\6\f\5B\2\3\0026\3\r\0003\4\15\0=\4\14\0036\3\16\0009\3\b\3'\5\17\0B\3\2\0012\0\0ÄK\0\1\0#command! GitCzTerm lua gitCz()\bvim\0\ngitCz\a_G\fon_open\0\15float_opts\1\0\1\vborder\vdouble\bcmd\1\0\4\18close_on_exit\1\bdir\fgit_dir\14direction\nfloat\vhidden\2\bnew\20git a && git cz\rTerminal\24toggleterm.terminal\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\17indent_lines\1\tmode\25document_diagnostics\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["typescript-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/typescript-vim",
    url = "https://github.com/leafgarland/typescript-vim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vim-autoclose"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-autoclose",
    url = "https://github.com/somini/vim-autoclose"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-bookmarks",
    url = "https://github.com/MattesGroeger/vim-bookmarks"
  },
  ["vim-bufferline"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-bufferline",
    url = "https://github.com/bling/vim-bufferline"
  },
  ["vim-css-color"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-css-color",
    url = "https://github.com/ap/vim-css-color"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-gotofile"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-gotofile",
    url = "https://github.com/zoubin/vim-gotofile"
  },
  ["vim-js-pretty-template"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-js-pretty-template",
    url = "https://github.com/Quramy/vim-js-pretty-template"
  },
  ["vim-jsdoc"] = {
    config = { "\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\21jsdoc_enable_es6\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-jsdoc",
    url = "https://github.com/heavenshell/vim-jsdoc"
  },
  ["vim-jsx-pretty"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-jsx-pretty",
    url = "https://github.com/MaxMEllon/vim-jsx-pretty"
  },
  ["vim-jsx-typescript"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-jsx-typescript",
    url = "https://github.com/peitalin/vim-jsx-typescript"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-node"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-node",
    url = "https://github.com/moll/vim-node"
  },
  ["vim-react-snippets"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-react-snippets",
    url = "https://github.com/mlaursen/vim-react-snippets"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-signify",
    url = "https://github.com/mhinz/vim-signify"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vue"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-vue",
    url = "https://github.com/posva/vim-vue"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["yajs.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/yajs.vim",
    url = "https://github.com/othree/yajs.vim"
  },
  ["yats.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim",
    url = "https://github.com/HerringtonDarkholme/yats.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n]\0\1\4\1\4\0\b5\1\1\0'\2\0\0\18\3\0\0&\2\3\2=\2\2\1-\2\0\0=\2\3\1L\1\2\0\0¿\vbuffer\tdesc\1\0\3\vnowait\2\fnoremap\2\vsilent\2\16nvim-tree: Á\1\1\1\v\0\15\0\0236\1\0\0'\3\1\0B\1\2\0023\2\2\0009\3\3\0019\3\4\0039\3\5\3\18\5\0\0B\3\2\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0009\a\v\0019\a\f\a9\a\r\a\18\b\2\0'\n\14\0B\b\2\0A\3\3\0012\0\0ÄK\0\1\0\20Close Directory\17parent_close\rnavigate\tnode\6b\6n\24nvim_buf_set_keymap\bapi\bvim\22default_on_attach\rmappings\vconfig\0\18nvim-tree.api\frequire@\1\0\4\0\4\0\b3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0014\3\0\0B\1\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lsp-zero.nvim
time([[Config for lsp-zero.nvim]], true)
try_loadstring("\27LJ\2\n;\0\2\5\1\3\0\6-\2\0\0009\2\0\0025\4\1\0=\1\2\4B\2\2\1K\0\1\0\0¿\vbuffer\1\0\0\20default_keymapsù\1\0\1\a\0\v\0\0196\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\4\0'\5\5\0005\6\6\0=\0\a\6B\1\5\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\b\0'\5\t\0005\6\n\0=\0\a\6B\1\5\1K\0\1\0\1\0\0\24<cmd>AerialNext<CR>\6}\vbuffer\1\0\0\24<cmd>AerialPrev<CR>\6{\6n\bset\vkeymap\bvimê\f\1\0\f\0R\0Æ\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1c\0=\1\4\0006\0\0\0009\0\1\0)\1c\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0006\4\v\0'\6\f\0B\4\2\0029\4\r\4B\0\4\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\14\0006\4\v\0'\6\f\0B\4\2\0029\4\15\4B\0\4\0016\0\16\0'\2\17\0'\3\n\0B\0\3\0016\0\16\0'\2\18\0'\3\14\0B\0\3\0016\0\v\0'\2\19\0B\0\2\0029\0\20\0004\2\0\0B\0\2\0029\1\21\0003\3\22\0B\1\2\0019\1\23\0005\3\24\0B\1\2\0019\1\25\0005\3\26\0B\1\2\0019\1\27\0B\1\1\0016\1\v\0'\3\28\0B\1\2\0029\1\29\0015\3\"\0004\4\3\0006\5\0\0009\5\30\0059\5\31\5'\a \0B\5\2\2'\6!\0&\5\6\5>\5\1\4=\4#\3B\1\2\0015\1'\0005\2%\0005\3$\0=\3&\2=\2(\0016\2\v\0'\4)\0B\2\2\0029\2\27\0025\4,\0005\5*\0=\1+\5=\5-\4B\2\2\0016\2\v\0'\4\f\0B\2\2\0029\2\27\2B\2\1\0016\2\v\0'\4.\0B\2\2\0029\2/\0029\2\27\0029\0040\0B\4\1\0A\2\0\0016\2\v\0'\0041\0B\2\2\0026\3\v\0'\5\19\0B\3\2\0029\0032\3B\3\1\2)\4\5\0009\5\27\0025\a8\0004\b\5\0005\t3\0=\0044\t>\t\1\b5\t5\0=\0044\t>\t\2\b5\t6\0=\0044\t>\t\3\b5\t7\0=\0044\t>\t\4\b=\b9\a5\b=\0009\t:\0029\t;\t5\v<\0B\t\2\2=\t>\b9\t?\3B\t\1\2=\t@\b9\tA\3B\t\1\2=\tB\b9\t:\0029\tC\tB\t\1\2=\tD\b9\tE\3B\t\1\2=\tF\b9\tG\3B\t\1\2=\tH\b=\b:\aB\5\2\0016\5\0\0009\5I\0059\5 \0055\aJ\0B\5\2\0016\5\v\0'\aK\0B\5\2\0029\5\27\0055\aM\0003\bL\0=\b\21\a5\bN\0=\bO\aB\5\2\0016\5\16\0'\aP\0'\bQ\0B\5\3\0012\0\0ÄK\0\1\0\27<cmd>AerialToggle!<CR>\15<leader>ae\rbackends\1\2\0\0\blsp\1\0\1\16filter_kind\1\0\vaerial\1\0\1\17virtual_text\1\15diagnostic\n<C-b>\26luasnip_jump_backward\n<C-f>\25luasnip_jump_forward\14<C-Space>\rcomplete\f<S-Tab>\28select_prev_or_fallback\n<Tab>\17tab_complete\t<CR>\1\0\0\1\0\1\vselect\1\fconfirm\fmapping\fsources\1\0\0\1\0\2\19keyword_length\3\3\tname\vbuffer\1\0\1\tname\15async-path\1\0\1\tname\rnvim_lsp\19max_item_count\1\0\2\19keyword_length\3\2\tname\fluasnip\15cmp_action\bcmp\16nvim_lua_ls\vlua_ls\14lspconfig\vserver\1\0\0\17capabilities\1\0\0\15typescript\17textDocument\1\0\0\17foldingRange\1\0\0\1\0\2\20lineFoldingOnly\2\24dynamicRegistration\1\npaths\1\0\0\14/snippets\vconfig\fstdpath\afn\14lazy_load luasnip.loaders.from_vscode\nsetup\1\2\0\0\rtsserver\22skip_server_setup\1\3\0\0\18rust_analyzer\nsqlls\18setup_servers\0\14on_attach\vpreset\rlsp-zero\azm\azr\tnmap\19closeFoldsWith\azM\17openAllFolds\bufo\frequire\azR\6n\bset\vkeymap\15foldenable\19foldlevelstart\14foldlevel\0061\15foldcolumn\bopt\bvim\0", "config", "lsp-zero.nvim")
time([[Config for lsp-zero.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nï\1\0\1\b\0\n\0\0146\1\0\0009\1\1\1'\3\2\0B\1\2\0016\1\0\0009\1\3\0019\1\4\0019\3\5\0'\4\6\0'\5\a\0'\6\b\0005\a\t\0B\1\6\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\15:close<CR>\6q\6n\nbufnr\24nvim_buf_set_keymap\bapi\17startinsert!\bcmd\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\2¿\vtoggleÕ\2\1\0\a\0\18\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\1\5\0\18\4\0\0009\2\6\0005\5\a\0=\1\b\0055\6\t\0=\6\n\0053\6\v\0=\6\f\5B\2\3\0026\3\r\0003\4\15\0=\4\14\0036\3\16\0009\3\b\3'\5\17\0B\3\2\0012\0\0ÄK\0\1\0#command! GitCzTerm lua gitCz()\bvim\0\ngitCz\a_G\fon_open\0\15float_opts\1\0\1\vborder\vdouble\bcmd\1\0\4\18close_on_exit\1\bdir\fgit_dir\14direction\nfloat\vhidden\2\bnew\20git a && git cz\rTerminal\24toggleterm.terminal\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: switch.vim
time([[Config for switch.vim]], true)
try_loadstring("\27LJ\2\n§\4\0\0\3\0\20\0'6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0004\1\16\0005\2\5\0>\2\1\0015\2\6\0>\2\2\0015\2\a\0>\2\3\0015\2\b\0>\2\4\0015\2\t\0>\2\5\0015\2\n\0>\2\6\0015\2\v\0>\2\a\0015\2\f\0>\2\b\0015\2\r\0>\2\t\0015\2\14\0>\2\n\0015\2\15\0>\2\v\0015\2\16\0>\2\f\0015\2\17\0>\2\r\0015\2\18\0>\2\14\0015\2\19\0>\2\15\1=\1\4\0K\0\1\0\1\3\0\0\btop\vbottom\1\3\0\0\nright\tleft\1\3\0\0\fexports\19module.exports\1\5\0\0\bget\bput\tpost\vdelete\1\4\0\0\tTrue\nFalse\tNone\1\3\0\0\vbefore\nafter\1\4\0\0\blog\twarn\nerror\1\4\0\0\16console.log\17console.warn\18console.error\1\4\0\0\blet\nconst\bvar\1\5\0\0\bmap\fforEach\vfilter\vreduce\1\4\0\0\tnull\14undefined\bNaN\1\5\0\0\blog\nerror\ndebug\twarn\1\4\0\0\funshift\tpush\nshift\1\3\0\0\vtypeof\15instanceof\1\3\0\0\ttrue\nfalse\30switch_custom_definitions\6-\19switch_mapping\6g\bvim\0", "config", "switch.vim")
time([[Config for switch.vim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\17indent_lines\1\tmode\25document_diagnostics\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nœ\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\2\ntheme\rmaterial\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet-vim', 'vim-css-color'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'emmet-vim', 'vim-css-color'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'emmet-vim'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'emmet-vim', 'vim-css-color'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'leshill-vim-json', 'json-formatter.vim', 'vim-gotofile'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'emmet-vim', 'vim-gotofile', 'vim-jsx-pretty'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vim-react-snippets', 'yajs.vim', 'yats.vim', 'es.next.syntax.vim', 'vim-node', 'typescript-vim', 'nvim-treesitter', 'vim-gotofile', 'vim-js-pretty-template', 'vim-jsdoc', 'vim-jsx-pretty'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'emmet-vim', 'vim-gotofile', 'vim-jsdoc', 'vim-jsx-pretty'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'BetterLua.vim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-react-snippets', 'yajs.vim', 'es.next.syntax.vim', 'vim-node', 'nvim-treesitter', 'vim-gotofile', 'vim-js-pretty-template', 'vim-jsdoc', 'vim-jsx-pretty'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'emmet-vim', 'es.next.syntax.vim', 'vim-css-color', 'nvim-treesitter', 'vim-jsdoc', 'vim-jsx-typescript'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'vim-vue', 'emmet-vim'}, { ft = "vue" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-vue/ftdetect/vue.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-vue/ftdetect/vue.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-vue/ftdetect/vue.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescript.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescript.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescriptreact.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescriptreact.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescriptreact.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/leshill-vim-json/ftdetect/json.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/leshill-vim-json/ftdetect/json.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/leshill-vim-json/ftdetect/json.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-node/ftdetect/node.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-node/ftdetect/node.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-node/ftdetect/node.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-jsx-typescript/ftdetect/typescript.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-jsx-typescript/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-jsx-typescript/ftdetect/typescript.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
