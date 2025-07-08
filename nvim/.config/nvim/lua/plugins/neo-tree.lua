return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VimEnter",
	enabled = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function(_, opts)
		local reveal_file = vim.fn.getcwd()
		require("neo-tree").setup({
			window = {
				width = 30,
			},
			filesystem = {
				filtered_items = {
					visible = false, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			hijack_netrw_behavior = "open_current",
			use_libuv_file_watcher = true,
			buffers = {
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
			},
			default_component_config = {
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "", -- this can only be used in the git_status source
						-- Status type
						untracked = "u",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
		})
		require("neo-tree.command").execute({
			action = "focus", -- OPTIONAL, this is the default value
			source = "filesystem", -- OPTIONAL, this is the default value
			position = "left", -- OPTIONAL, this is the default value
			reveal_file = reveal_file, -- path to file or folder to reveal
			reveal_force_cwd = true, -- change cwd without asking if needed
		})
		vim.keymap.set("n", "<space>e", ":Neotree position=left toggle<CR>", {})
		vim.keymap.set("n", "<leader>b", ":Neotree buffers reveal float<CR>", {})
	end,
}
