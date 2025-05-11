return {
	{
		"github/copilot.vim",
		lazy = false,
		event = "VimEnter",
		enabled = false,
		config = function()
			vim.g.copilot_filetypes = {
				["*"] = false,
				markdown = true,
				latex = true,
				js = true,
				lua = true,
				tsx = true,
			}

			vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
			vim.g.copilot_no_tab_map = true
		end,
	},
}
