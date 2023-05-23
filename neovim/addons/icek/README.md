# Ice King Addon

Ice King is a plugin for help you manage services and dev tasks

## Commands

- `<leader>t` runs the selection for general actions

### Requirements

These are the following requirements for packer

```lua
use {
    requires = {
        "folke/trouble.nvim",
        "nvim-tree/nvim-web-devicons",
        "rcarriga/nvim-notify",
        "kitty-runner.nvim",
    },
    config = function ()
        require("icek").setup()
    end
}
```
