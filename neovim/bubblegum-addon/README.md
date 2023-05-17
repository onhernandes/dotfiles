# Bubblegum Addon

Bubblegoum is a plugin for help you code better by using some tools

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
        -- {{{
        -- for ChatGPT.nvim
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "jackMort/ChatGPT.nvim",
        -- }}}
    }
    config = function ()
        require("bubblegum-addon").setup()
    end
}
```
