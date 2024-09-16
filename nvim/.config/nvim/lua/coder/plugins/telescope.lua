return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    local function find_command()
      if 1 == vim.fn.executable("rg") then
        return { "rg", "--files", "--color", "never", "-g", "!.git" }
      elseif 1 == vim.fn.executable("fd") then
        return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
      elseif 1 == vim.fn.executable("fdfind") then
        return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
      elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
        return { "find", ".", "-type", "f" }
      elseif 1 == vim.fn.executable("where") then
        return { "where", "/r", ".", "*" }
      end
    end

    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      pickers = {
        live_grep = {
          find_command = find_command,
          file_ignore_patterns = {
            "./node_modules",
            "*node_modules/*",
            "*/node_modules",
            "*/.git",
            "*/.git/*",
            ".venv",
            "node_modules",
            ".git",
            ".venv",
          },
          additional_args = function(_)
            return { "--hidden" }
          end,
        },
        find_files = {
          find_command = find_command,
          file_ignore_patterns = {
            "./node_modules",
            "*/node_modules/*",
            "*/node_modules",
            "*/.git",
            "*/.git/*",
            ".venv",
            "node_modules",
            ".git",
            ".venv",
          },
          hidden = true,
          no_ignore = true,
        },
      },
      extensions = {
        "fzf",
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
      file_ignore_patterns = {
        "./node_modules",
        "*/node_modules/*",
        "*/node_modules",
        "*/.git",
        "*/.git/*",
        ".venv",
        "node_modules",
        ".git",
        ".venv",
      },

      defaults = {
        hidden = true,
        layout_strategy = "vertical",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-p>"] = actions.move_selection_previous, -- move to prev result
            ["<C-n>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-x>"] = trouble_telescope.open,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", ";f", builtin.find_files, { desc = "[F]ind Files" })
    vim.keymap.set("n", ";g", builtin.live_grep, { desc = "[G]rep String" })
    vim.keymap.set("n", ";m", builtin.buffers, { desc = "[F]ind Buffers" })
    vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "[H]elp tags" })
    vim.keymap.set("n", ";s", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end, { desc = "[S]earch current [W]ord" })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    vim.keymap.set("n", ";ds", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", ";dg", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    vim.keymap.set("n", ";df", function()
      builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
    end, { desc = "[S]earch [N]eovim files" })
  end,
}
