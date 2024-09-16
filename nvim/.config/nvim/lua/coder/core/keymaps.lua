vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap.set
-- Keybinds
map("n", "x", '"_x')

-- select a line
map("n", "val", "V")
-- move line up and down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- cursor don't move at end easily
map("n", "J", "mzJ`z")
map("n", "<Tab>", "%")

-- cursor in center while scrolling
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "{", "{zz")
map("n", "}", "}zz")
map("n", "N", "Nzz")
map("n", "n", "nzz")
map("n", "G", "Gzz")
map("n", "gg", "ggzz")
map("n", "gd", "gdzz")

-- map("n", "<C-i>", "<C-i>zz")
map("n", "<C-o>", "<C-o>zz")
map("n", "%", "%zz")
map("n", "*", "*zz")
map("n", "#", "#zz")
-- map("n", "j", "jzz")
-- map("n", "k", "kzz")
-- find and replace
map("n", "<leader>s", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

--start and end nvaigation
map("n", "L", "$")
map("n", "H", "^")

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")

-- map("n", "<leader>f", function()
--   local client = vim.lsp.get_active_clients({ bufnr = 0 })[1]
--   if client and client.supports_method("textDocument/formatting") then
--     vim.lsp.buf.format()
--   end
-- end)

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>x", "<cmd>!chmod +x %<CR> <bar> :echo 'chmod permission granted'<CR> ", { silent = true })

-- move windows
map("n", "sv", "<C-w>v")
map("n", "ss", "<C-w>s")
map("n", "sx", "<C-w><C-o>")
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- _ is register which not store but + do

map({ "n", "v" }, ";y", [["+y]])
map({ "n", "v" }, ";d", [["+d]])
map({ "n", "v" }, "<leader>d", [["_d]])
map({ "n", "v" }, "<leader>p", [["_p]])

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- map({ "v", "i" }, "ii", "<Esc>")

-- GIT FILES FINDER
-- map("n", "<leader>gf", function()
--   local cmd = {
--     "sort",
--     "-u",
--     "<(git diff --name-only --cached)",
--     "<(git diff --name-only)",
--     "<(git diff --name-only --diff-filter=U)",
--   }
--
--   local utils = {}
--   utils.is_git_directory = function()
--     local result = vim.fn.system("git rev-parse --is-inside-work-tree")
--     if vim.v.shell_error == 0 and result:find("true") then
--       return true
--     else
--       return false
--     end
--   end
--   if not utils.is_git_directory() then
--     vim.notify(
--       "Current project is not a git directory",
--       vim.log.levels.WARN,
--       { title = "Telescope Git Files", git_command = cmd }
--     )
--   else
--     require("telescope.builtin").git_files()
--   end
-- end, { desc = "Search [G]it [F]iles" })

-- General
map("n", "<leader>q", ":qa! <cr>", opts)
map("n", "<leader>a", "gg<S-v>G", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- cpp compile commands
-- map("n", "<F5>", ":w <bar> !clear && g++ %:r.cpp -o %:r.exe<CR> <bar> :!./%:r.exe<CR>", opts)
map(
  "n",
  "<F5>",
  ":silent! w <bar> :silent! !g++ %:r.cpp -o %:r.exe <CR> <bar> :!./%:r.exe <CR> <bar> <CR> <bar> :echo 'compiled success' <CR>",
  { silent = true }
)
map("n", "<F9>", ":silent! w <bar> !clear && g++ %:r.cpp -o %:r.exe <CR>", opts)
map("n", "<F10>", ":!./%:r.exe<CR>", opts)

-- Increment / Decrement
map("n", "<leader>=", "<C-a>", { desc = "Increment number" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

map("n", ";e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- toggle buffer
map("n", ";n", ":bnext <CR>")
