return {
  "epwalsh/obsidian.nvim",
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "Obsidian Notes",
          path = "~/Documents/Obsidian-Notes/",
        },
      },
      notes_subdir = "inbox",
      new_notes_location = "notes_subdir",
      disable_frontmatter = true,

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M:%S",
      },

      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
        -- Replace the above with this if you don't have a patched font:
        -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
        -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },
      },

      completion = {
        nvim_cmp = true,
      },
    })
  end,
}
