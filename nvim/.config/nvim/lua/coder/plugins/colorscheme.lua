function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {

  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      ColorMyPencils("gruvbox")
      vim.opt.background = "dark"
    end,
    opts = ...,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    opts = {
      style = "night",
    },
    config = function()
      ColorMyPencils("tokyonight")
      vim.opt.background = "dark"
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    enabled = false,
    config = function()
      ColorMyPencils("oxocarbon")
    end,
  },
}
