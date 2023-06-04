local M = {
	actions = {},
	runners = {},
	global_options = {
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    files = { "package.json" }
	},
}

local notify = require("notify")

M.add_action = function(props)
	require("bubblegum.utils").add_action(M.actions, props)
end

M.runners.npm_install_pkg = function()
	local Job = require("plenary.job")
	local title = "Install NPM Package"
	local src = vim.loop.cwd()
	local pkg_path = src .. "/package.json"
	local package_json_exists = vim.loop.fs_stat(pkg_path)

	local function on_input(input)
		local save_param = "--save"
		if string.find(input, "-SD") then
			save_param = "--save-dev"
			input = string.gsub(input, "-SD", "")
		end

		local debug = false
		if string.find(input, "--debug") then
			debug = true
			input = string.gsub(input, "--debug", "")
		end

		input = input:gsub("^%s*(.-)%s*$", "%1")
		local is_input_valid = input ~= nil and vim.fn.strchars(input) > 0

		if is_input_valid then
			local msgs = {}
			notify("Installing...", "info", { title = title, hide_from_history = false })
			Job:new({
				command = "npm",
				args = { "install", save_param, input },
				cwd = src,
				on_stdout = function(_, msg)
					if msg ~= "" then
						table.insert(msgs, #msgs - 1, msg)
					end
				end,
				on_exit = function()
					if debug then
						notify(msgs, "debug", { title = title, hide_from_history = false })
					end

					notify("Installation finished", "info", { title = title, hide_from_history = false })
				end,
			}):start()
		end

		if not is_input_valid then
			notify("invalid input " .. input, "error", { title = title, hide_from_history = false })
		end
	end
	if package_json_exists then
		vim.ui.input({ prompt = "Which package do you want to install?" }, on_input)
	end

	if not package_json_exists then
		notify("package.json not found at " .. pkg_path, "error", { title = title })
	end
end

M.add_action({
	action_name = "npm_install_pkg",
	title = "NPM Install Package",
	description = "Uses NPM and install desired package into current project",
	ft = M.global_options.ft,
	files = M.global_options.files,
	runner = M.runners.npm_install_pkg,
})

M.runners.npm_remove_pkg = function()
	local Job = require("plenary.job")
	local title = "Uninstall NPM Package"
	local src = vim.loop.cwd()
	local pkg_path = src .. "/package.json"
	local package_json_exists = vim.loop.fs_stat(pkg_path)

	local function on_input(input)
		local debug = false
		if string.find(input, "--debug") then
			debug = true
			input = string.gsub(input, "--debug", "")
		end

		input = input:gsub("^%s*(.-)%s*$", "%1")
		local is_input_valid = input ~= nil and vim.fn.strchars(input) > 0

		if is_input_valid then
			local msgs = {}
			notify("Uninstalling...", "info", { title = title, hide_from_history = false })
			Job:new({
				command = "npm",
				args = { "uninstall", input },
				cwd = src,
				on_stdout = function(_, msg)
					if msg ~= "" then
						table.insert(msgs, #msgs - 1, msg)
					end
				end,
				on_exit = function()
					if debug then
						notify(msgs, "debug", { title = title, hide_from_history = false })
					end

					notify("Package removed", "info", { title = title, hide_from_history = false })
				end,
			}):start()
		end

		if not is_input_valid then
			notify("Invalid input " .. input, "error", { title = title, hide_from_history = false })
		end
	end
	if package_json_exists then
		vim.ui.input({ prompt = "Which package do you want to remove?" }, on_input)
	end

	if not package_json_exists then
		notify("package.json not found at " .. pkg_path, "error", { title = title })
	end
end

M.add_action({
	action_name = "npm_remove_pkg",
	title = "NPM Remove Package",
	description = "Uses NPM and uninstalls desired package from current project",
	ft = M.global_options.ft,
	files = M.global_options.files,
	runner = M.runners.npm_remove_pkg,
})

M.runners.npm_sync = function()
	local Job = require("plenary.job")
	local title = "Sync with package.json"
	local src = vim.loop.cwd()
	local pkg_path = src .. "/package.json"
	local package_json_exists = vim.loop.fs_stat(pkg_path)

	if package_json_exists then
		Job:new({
			command = "npm",
			args = { "install" },
			cwd = src,
			on_exit = function()
				notify("Package removed", "info", { title = title, hide_from_history = false })
			end,
		}):start()
	end

	if not package_json_exists then
		notify("package.json not found at " .. pkg_path, "error", { title = title })
	end
end

M.add_action({
	action_name = "npm_sync",
	title = "NPM Remove Package",
	description = "Installs everything from package.json",
	ft = M.global_options.ft,
	files = M.global_options.files,
	runner = M.runners.npm_sync,
})

M.get_actions = function()
	return M.actions
end

return M
