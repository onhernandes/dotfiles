HOME = os.getenv("HOME")

local plugins = require("plugins")
plugins.ensure_packer_installed()
require("configs").setup_config()
require("mappings").setup_mappings()
plugins.setup_plugins()
