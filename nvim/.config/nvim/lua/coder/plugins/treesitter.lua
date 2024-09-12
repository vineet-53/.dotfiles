return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      config = true,
    },
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      ensure_installed = {
        "json",
        "javascript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "c",
        "cpp",
        "rust",
        "go",
        "gomod",
        "make",
        "regex",
        "scss",
        "sql",
        "svelte",
        "terraform",
        "toml",
        "regex",
        "vimdoc",
      },
    })
    vim.filetype.add({
      extension = {
        mdx = "mdx",
      },
    })
    vim.treesitter.language.register("markdown", "mdx")
    local lspDiagnosticsVisible = false

    vim.diagnostic.config({
      virtual_text = lspDiagnosticsVisible,
      underline = lspDiagnosticsVisible,
    })

    vim.keymap.set("n", "<leader>lx", function()
      lspDiagnosticsVisible = not lspDiagnosticsVisible
      vim.diagnostic.config({
        virtual_text = lspDiagnosticsVisible,
        underline = lspDiagnosticsVisible,
      })
    end)
  end,
}
