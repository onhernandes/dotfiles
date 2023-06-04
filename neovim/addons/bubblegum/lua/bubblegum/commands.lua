local M = {
	bubbles = {},
}

local bubble_utils = require("bubblegum.utils")
local notify = require("notify")
local notify_title = "Bubblegum Commands"

M.register_bubble = function(props)
	table.insert(M.bubbles, props)
end

M.register_bubble({
	global_name = "BubbleCode",
	keymap = function (runner)
    notify("Setup keymap", "info", { title = notify_title, hide_from_history = false })
    _G.BubbleCode = runner
    vim.api.nvim_set_keymap("n", "<leader>t", ":lua BubbleCode()<CR>", { noremap = true })
	end,
	runner = function()
		local actions = require("bubblegum.bubbles.code").get_actions()
		local current_buffer = vim.api.nvim_get_current_buf()
		local current_filetype = vim.api.nvim_buf_get_option(current_buffer, "filetype")

		local ui_select_opts = {
			prompt = "Choose a code action: ",
		}

		local select_values = {}

		for _, action in pairs(actions) do
			local has_valid = bubble_utils.list_contains(action.ft, current_filetype)
			local has_any = bubble_utils.list_contains(action.ft, "any")

			if has_valid or has_any then
				table.insert(select_values, action.title)
			end
		end

		local on_select = bubble_utils.on_select(actions)
		vim.ui.select(select_values, ui_select_opts, on_select)
	end,
})

M.register_bubble({
	global_name = "BubbleWorkspace",
	keymap = function (runner)
    _G.BubbleWorkspace = runner
    vim.api.nvim_set_keymap("n", "<leader>e", ":lua BubbleWorkspace()<CR>", { noremap = true })
	end,
	runner = function()
		local cwd = vim.loop.cwd()
		local files = vim.fn.readdir(cwd)
		local actions = require("bubblegum.bubbles.npm").get_actions()
		local select_values = {}

		for _, action in ipairs(actions) do
      notify("Hey", "info", { title = notify_title })
      notify("has files " .. next(action.files), "info", { title = notify_title })
			if type(action.files) == "table" then
				for _, file in ipairs(actions.files) do
					local exists = bubble_utils.list_contains(files, file)
          notify("Exists " .. tostring(exists), "info", { title = notify_title })

					if exists then
						table.insert(select_values, action.title)
						break
					end
				end
			end
		end

		local ui_select_opts = {
			prompt = "Choose a workspace action: ",
		}

		local on_select = bubble_utils.on_select(actions)
		vim.ui.select(select_values, ui_select_opts, on_select)
	end,
})

M.setup = function()
	for _, bubble in ipairs(M.bubbles) do
		_G[bubble.global_name] = bubble.runner
		local run_by_lua = "lua " .. bubble.global_name .. "()<CR>"

		vim.cmd("command! " .. bubble.global_name .. " " .. run_by_lua)

		if bubble.keymap then
      bubble.keymap(bubble.runner)
		end
	end
end

return M
