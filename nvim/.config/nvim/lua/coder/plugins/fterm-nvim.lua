return {
  "numToStr/FTerm.nvim",
  enabled = false,
  config = function()
    require("FTerm").setup({
      border = "double",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })

    -- Example keybindings
    vim.keymap.set("n", "<A-j>", '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set("t", "<A-j>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end,
}
