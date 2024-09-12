-- This is used for nvim cmd line change and give more immersive look to nvim - cmdline
return {
  "folke/noice.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    -- routes = {
    --   {
    --     filter = { event = "notify", find = "No information available" },
    --     opts = { skip = true },
    --   },
    -- },
    -- presets = {
    --   lsp_doc_border = true,
    -- },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
