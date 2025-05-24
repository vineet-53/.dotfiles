return { 
  { 
    "nvim-treesitter/nvim-treesitter",
  },
  { 
    "stevearc/dressing.nvim",
  },
  { 
    "MunifTanjim/nui.nvim",
  },
  --- The below dependencies are optional,
  { 
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
  },
  { 
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  },
  { 
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
  },
  { 
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
  {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-p>"] = require("telescope.actions").move_selection_previous,
						["<C-n>"] = require("telescope.actions").move_selection_next,
						["<C-y>"] = require("telescope.actions").select_default,
					},
				},
			},
			pickers = {
				find_files = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					hidden = true,
				},
			},
			live_grep = {
				file_ignore_patterns = { "node_modules", ".git", ".venv" },
				additional_args = function(_)
					return { "--hidden" }
				end,
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", ";f", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", ";s", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", ";g", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", ";e", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })
	end,
}
}
