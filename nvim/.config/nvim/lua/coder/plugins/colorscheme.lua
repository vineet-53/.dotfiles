return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
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
