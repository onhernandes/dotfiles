local M = {}

local actions = require("bubblegum-addon.actions")

M.list_contains = function(list, item)
	for _, str in ipairs(list) do
		if string.find(str, item) or string.find(item, str) then
			return true
		end
	end
	return false
end

M.on_select_magic_action = function(action_title)
	actions.run_action_by_key("title", action_title)
end

M.render_select = function()
	local current_buffer = vim.api.nvim_get_current_buf()
	local current_filetype = vim.api.nvim_buf_get_option(current_buffer, "filetype")

	local ui_select_opts = {
		prompt = "Choose a code action: ",
	}

	local code_actions = {}

	for _, action in pairs(actions.actions) do
		local has_valid_ft = M.list_contains(action.ft, current_filetype)
		local has_any = M.list_contains(action.ft, "any")

		if has_valid_ft or has_any then
			table.insert(code_actions, action.title)
		end
	end

	vim.ui.select(code_actions, ui_select_opts, M.on_select_magic_action)
end

M.run_fred = function()
	-- Desired actions:
	-- npm install package
	-- python install package
	-- npm sync using npm ci + nvm
	-- nvm use
	M.render_select()
end

M.setup_keymaps = function()
	_G.Run_fred = M.run_fred
	vim.api.nvim_set_keymap("n", "<leader>t", ":lua Run_fred()<CR>", { noremap = true })
end

M.setup_deps = function()
	-- setup trouble
	require("trouble").setup({
		mode = "document_diagnostics",
		indent_lines = false,
	})

	-- setup jackMort/ChatGPT.nvim
	-- require("chatgpt").setup()
end

M.setup = function()
	M.setup_keymaps()
	M.setup_deps()
end

return M
