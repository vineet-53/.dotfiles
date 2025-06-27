return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = { "emmet-ls", "prettier" },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_nvim_lsp.default_capabilities()
			)
			local lspconfig = require("lspconfig")

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
			})
			lspconfig.ast_grep.setup({
				capabilities = capabilities,
				filetypes = {
					"c",
					"cpp",
					"rust",
					"go",
					"java",
					"python",
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"html",
					"css",
					"kotlin",
					"dart",
					"lua",
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
		end,
	},
}
