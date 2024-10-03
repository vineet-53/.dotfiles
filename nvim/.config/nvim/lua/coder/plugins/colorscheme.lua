return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Example config in lua
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false

      -- Load the colorscheme
      require("nord").set()

      -- Toggle background transparency
      local bg_transparent = true

      local toggle_transparency = function()
        bg_transparent = not bg_transparent
        vim.g.nord_disable_background = bg_transparent
        vim.cmd([[colorscheme nord]])
      end

      vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
    end,
  },
  {
    "savq/melange-nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.o.background = "dark"
      vim.cmd.colorscheme("melange")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
        },
      })
      vim.cmd.colorscheme("rose-pine-moon")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },

  {
    "navarasu/onedark.nvim",
    enabled = false,
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      require("onedark").load()
    end,
  },
  {
    "kaiuri/nvim-juliana",
    enabled = false,
    lazy = false,
    opts = { --[=[ configuration --]=]
    },
    config = true,
  },
  { "catppuccin/nvim", enabled = false, name = "catppuccin", priority = 1000 },
}
