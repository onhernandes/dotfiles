local M = {}

local utils = require("utils")
M.ensure_packer_installed = function()
	local packer_packages_path = vim.fn.stdpath("data") .. "/site/pack/packer/start"
	local fn = vim.fn
	local install_path = packer_packages_path .. "/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

M.misc_plugins = function(use)
	-- Packer manages itself
	use("wbthomason/packer.nvim")
	use("nvim-tree/nvim-web-devicons")

	-- Misc
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("tpope/vim-surround")
	use("tpope/vim-dispatch")
	use("rhysd/clever-f.vim")
	use("bling/vim-bufferline")
	use("somini/vim-autoclose")
	--use("mhinz/vim-startify")
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
			vim.g.dashboard_default_executive = "fzf.vim"
		end,
	})
	use("stefandtw/quickfix-reflector.vim")
	use("tpope/vim-sensible")
	use("wakatime/vim-wakatime")
	use("matze/vim-move")
	use("tpope/vim-unimpaired")
	use("jiangmiao/auto-pairs")
	use({
		"mileszs/ack.vim",
		config = function()
			vim.g.ackprg = "ag --nogroup --nocolor --column"
		end,
	})

	-- Completion suggestion
	use("roxma/nvim-yarp")

	-- Bookmarks
	use("MattesGroeger/vim-bookmarks")
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
	use("mhinz/vim-signify")
	vim.g.signify_sign_add = "+"
	vim.g.signify_sign_delete = "_"
	vim.g.signify_sign_delete_first_line = "‾"
	vim.g.signify_sign_change = "~"
	vim.g.signify_sign_changedelete = "~"

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		require = { "kyazdani42/nvim-web-devicons" },
		config = function()
			-- Protected call to avoid errors on first run
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "material",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	})

	use("stevearc/dressing.nvim")
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
    disable = true,
		run = ":TSInstall typescript javascript python",
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "python" },
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = false,
				},
			})
		end,
	})

	-- Targets
	use("wellle/targets.vim")
	vim.g.targets_quotes = "\"d 'q `"

	-- Switch
	use({
		"AndrewRadev/switch.vim",
		config = function()
			vim.g.switch_mapping = "-"
			vim.g.switch_custom_definitions = {
				{ "true", "false" },
				{ "typeof", "instanceof" },
				{ "unshift", "push", "shift" },
				{ "log", "error", "debug", "warn" },
				{ "null", "undefined", "NaN" },
				{ "map", "forEach", "filter", "reduce" },
				{ "let", "const", "var" },
				{ "console.log", "console.warn", "console.error" },
				{ "log", "warn", "error" },
				{ "before", "after" },
				{ "True", "False", "None" },
				{ "get", "put", "post", "delete" },
				{ "exports", "module.exports" },
				{ "right", "left" },
				{ "top", "bottom" },
			}
		end,
	})
end

M.lsp = function(use)
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					vim.cmd("MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "FelipeLema/cmp-async-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-nvim-lua" },
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" },
			{ "jose-elias-alvarez/typescript.nvim" },
			{ "kevinhwang91/promise-async" },
			{ "kevinhwang91/nvim-ufo" },
			{ "stevearc/aerial.nvim" },
		},
		config = function()
			-- New folding
			vim.opt.foldcolumn = "1"
			-- Using ufo provider need a large value, feel free to decrease the value
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldenable = true

			-- Using ufo provider need remap `zR` and `zM`.
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeFoldsWith)

			vim.api.nvim_set_keymap("n", "zr", "zR", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "zm", "zM", { noremap = true, silent = true })

			vim.cmd([[
        set omnifunc=
      ]])
			local lsp = require("lsp-zero").preset({})

			lsp.on_attach(function(_, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			lsp.ensure_installed({ "rust_analyzer", "sqlls", "pyright" })
			lsp.skip_server_setup({ "tsserver" })
			lsp.setup()

			require("luasnip").filetype_extend("python", { "django" })
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = {
					vim.fn.stdpath("config") .. "/snippets",
				},
			})
			require("luasnip.loaders.from_vscode").load()

			local server_capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			}

			-- vim.lsp.set_log_level("debug")
			require("typescript").setup({
				server = {
					capabilities = server_capabilities,
					cmd = { "typescript-language-server", "--stdio", "--log-level", "4" },
					init_options = {
						hostInfo = "neovim",
						maxTsServerMemory = 4096,
					},
				},
			})
			require("ufo").setup()

			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()

			local default_max_item_count = 5
			cmp.setup({
				sources = {
					{ name = "luasnip", keyword_length = 2, max_item_count = default_max_item_count },
					{ name = "nvim_lsp", max_item_count = default_max_item_count },
					{ name = "async-path", max_item_count = default_max_item_count },
					{ name = "buffer", keyword_length = 3, max_item_count = default_max_item_count },
				},
				mapping = {
					-- `Enter` key to confirm completion
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp_action.tab_complete(),
					["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
					-- Ctrl+Space to trigger completion menu
					["<C-Space>"] = cmp.mapping.complete(),
					-- Navigate between snippet placeholder
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
				},
			})

			vim.diagnostic.config({
				virtual_text = false,
			})

			require("aerial").setup({
				on_attach = function(bufnr)
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
				backends = { "lsp" },
				filter_kind = false,
			})
			vim.api.nvim_set_keymap("n", "<leader>ae", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true })
		end,
	})
end

function GitCz()
	local Terminal = require("toggleterm.terminal").Terminal
	local git_cz = "git a && git cz"
	local git_commit = Terminal:new({
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
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", ":close<CR>", { noremap = true, silent = true })
		end,
	})

	git_commit:toggle()
end

M.git = function(use)
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		run = "npm i -g commitizen cz-conventional-changelog",
		config = function()
			require("toggleterm").setup()
			vim.cmd("command! GitCzTerm lua GitCz()")
		end,
	})
end

M.linting = function(use)
	use({
		"dense-analysis/ale",
		run = "pip install black && npm i -g @johnnymorganz/stylua-bin",
		config = function()
			vim.g.ale_sign_error = "✘"
			vim.g.ale_sign_warning = "▲"
			vim.g.ale_set_quickfix = 1
			vim.g.ale_completion_enabled = 1
			vim.g.ale_disable_lsp = 1
			vim.g.ale_virtualtext_cursor = "disabled"
			vim.g.ale_python_flake8_options = "--select C,E,F,W,B,B950 --ignore E501 --max-line-length 80"
			local ale_fixers = {}
			local js_fixers = { "eslint" }
			ale_fixers["javascript"] = js_fixers
			ale_fixers["javascriptreact"] = js_fixers
			ale_fixers["typescript"] = js_fixers
			ale_fixers["typescriptreact"] = js_fixers
			ale_fixers["vue"] = js_fixers
			ale_fixers["css"] = { "csslint" }
			ale_fixers["sass"] = { "prettier" }
			ale_fixers["scss"] = ale_fixers["sass"]
			ale_fixers["html"] = { "htmlhint" }
			ale_fixers["python"] = { "black" }
			ale_fixers["lua"] = { "stylua" }
			vim.g.ale_fixers = ale_fixers

			local ale_linters = {}
			ale_linters["javascript"] = { "eslint", "flow-language-server" }
			ale_linters["typescript"] = { "eslint" }
			ale_linters["vue"] = { "eslint" }
			ale_linters["python"] = { "flake8" }
			ale_linters["lua"] = { "stylua" }
			vim.g.ale_linters = ale_linters

			vim.api.nvim_set_keymap("n", "<leader>af", ":ALEFix<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>al", ":ALELint<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>ar", ":ALEFindReferences<CR>", { noremap = true, silent = true })
		end,
	})
end

M.file_browser = function(use)
	use({
		"nvim-tree/nvim-tree.lua",
		require = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})

	vim.api.nvim_set_keymap("n", "<leader>vf", ":NvimTreeFindFile<cr>", { silent = true, noremap = true })
	vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })

	-- Files
	use({ "zoubin/vim-gotofile", ft = { "javascript", "typescript", "jsx", "tsx", "json" } })

	-- FZF Stuff
	use({
		"junegunn/fzf",
		requires = { "junegunn/fzf.vim" },
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	-- Map :Files as Find Files
	utils.nmap("<leader>ff", ":Files ./<cr>")

	-- Map :Ag as Find Code
	utils.nmap("<leader>fc", ":Ag <cr>")
	vim.cmd([[
    command! -bang -nargs=* GitAg
      \ call fzf#vim#ag(<q-args>, {'dir': systemlist('git rev-parse --show-toplevel')[0]}, <bang>0)
  ]])
end

M.ecma = function(use)
	-- Vim JSON support
	use({ "leshill/vim-json", as = "leshill-vim-json", ft = "json" })
	-- JSON Formatter: <leader>json
	use({ "XadillaX/json-formatter.vim", ft = "json", run = "npm install jjson -g" })
	-- Better JS Highlight
	use({ "othree/yajs.vim", ft = { "javascript", "typescript" } })
	-- Support for ES.Next features
	use({ "othree/es.next.syntax.vim", ft = { "javascript", "typescript", "typescriptreact" } })
	use({ "mlaursen/vim-react-snippets", ft = { "javascript", "typescript" } })
	-- JSX Support for React
	use({ "MaxMEllon/vim-jsx-pretty", ft = { "javascript", "jsx", "typescript", "tsx" } })
	-- Highlight JavaScript's Template Strings contents in other FileType syntax rule
	use({ "Quramy/vim-js-pretty-template", ft = { "javascript", "typescript" } })
	-- Typescript
	use({ "leafgarland/typescript-vim", ft = { "typescript" } })
	-- tsx
	use({ "peitalin/vim-jsx-typescript", ft = { "typescriptreact" } })
	--Typescript
	use({ "HerringtonDarkholme/yats.vim", ft = "typescript" })

	-- JSDocs
	use({
		"heavenshell/vim-jsdoc",
		ft = { "javascript", "jsx", "typescript", "typescriptreact" },
		run = "make install",
		config = function()
			vim.g.jsdoc_enable_es6 = 1
		end,
	})

	-- JS Libs support
	-- NodeJS
	use({ "moll/vim-node", ft = { "javascript", "typescript" } })

	-- HTML, CSS & Front-end related stuff
	use({ "ap/vim-css-color", ft = { "css", "scss", "sass", "typescriptreact" } })
	-- Emmet
	use({
		"mattn/emmet-vim",
		ft = { "vue", "scss", "sass", "css", "html", "php", "typescriptreact", "jsx", "tsx" },
		config = function()
			vim.g.user_emmet_mode = "a"
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = { ".tsx", ".vue", ".jsx", ".html", ".css", ".scss", ".sass" },
				command = ":PackerLoad emmet-vim<CR>:EmmetInstall<CR>",
			})
		end,
	})

	-- VueJS
	use({ "posva/vim-vue", ft = { "vue" } })
	vim.g.vue_disable_pre_processors = 1
	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "javascript", "vim", "html", "typescript", "typescriptreact" },
		config = [[require('colorizer').setup {}]],
	})
end

M.misc_lang_support = function(use)
	-- TOML support
	use({ "cespare/vim-toml", ft = "toml" })

	-- Lua better syntax highlight
	use({ "euclidianAce/BetterLua.vim", ft = "lua" })
end

M.theming = function(use)
	-- Themes
	local my_themes = {
		eva = "hachy/eva01.vim",
		kanagawa = "rebelot/kanagawa.nvim",
	}
	local theme_name = my_themes.kanagawa
	use({
		theme_name,
	})

	vim.cmd([[
    if !exists('g:syntax_on')
      syntax enable
    endif    

    set background = "dark"
    colorscheme kanagawa
  ]])
end

M.setup_bubblegum = function (use)
	local bubblegum_path = vim.fn.stdpath("config") .. "/bubblegum-addon"
	use({
		bubblegum_path,
		requires = {
			"folke/trouble.nvim",
			"nvim-tree/nvim-web-devicons",
			"rcarriga/nvim-notify",
			-- {{{
			-- for ChatGPT.nvim
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"jackMort/ChatGPT.nvim",
			-- }}}
		},
		config = function()
			require("bubblegum-addon").setup()
		end,
	})
end

M.setup_plugins = function()
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

	local use = packer.use
	M.misc_plugins(use)
	M.lsp(use)
	M.linting(use)
	M.file_browser(use)
	M.misc_lang_support(use)
	M.ecma(use)
	M.git(use)
	M.theming(use)
  M.setup_bubblegum(use)
end

return M
