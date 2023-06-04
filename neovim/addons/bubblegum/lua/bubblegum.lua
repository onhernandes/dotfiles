local M = {}

local commands = require("bubblegum.commands")

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
	M.setup_deps()
  commands.setup()
end

return M
