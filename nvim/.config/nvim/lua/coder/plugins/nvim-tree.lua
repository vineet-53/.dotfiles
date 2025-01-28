local function my_attach()
  local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not config_status_ok then
    return
  end

  local tree_cb = nvim_tree_config.nvim_tree_callback

  nvim_tree.setup({
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
      relativenumber = true,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
      custom = {
        "node_modules/.*",
      },
    },
    log = {
      enable = true,
      truncate = true,
      types = {
        diagnostics = true,
        git = true,
        profile = true,
        watcher = true,
      },
    },
  })
end

return {
  "nvim-tree/nvim-tree.lua",
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      on_attach = my_attach(),
    })
    vim.g.nvim_tree_icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
      },
    }
  end,
}
