local M = {}

M.map = function (mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

M.nmap = function (shortcut, command)
  M.map('n', shortcut, command)
end

M.imap = function (shortcut, command)
  M.map('i', shortcut, command)
end

M.vmap = function (shortcut, command)
  M.map('v', shortcut, command)
end

M.cmap = function (shortcut, command)
  M.map('c', shortcut, command)
end

M.tmap = function (shortcut, command)
  M.map('t', shortcut, command)
end

M.log = function (level, message, scope)
  local title = scope .. ":" .. level
  local full_msg = scope .. ":" .. level .. " " .. message
  require("notify")(full_msg, level, { title = title })
end

return M
