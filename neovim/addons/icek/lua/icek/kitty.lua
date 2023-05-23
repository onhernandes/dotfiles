local M = {
  kitty = {}
}

M.setup_kitty_api = function ()
  local  kittyrunner = require("kitty-runner")
  kittyrunner.setup()
end

return M
