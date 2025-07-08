return {
	"akinsho/bufferline.nvim",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					all = {
						fill = { bg = "#262736" },
					},
					mocha = {
						background = { fg = "#313245" },
					},
					latte = {
						background = { fg = "#000000" },
					},
				},
			}),
		})
	end,
}
