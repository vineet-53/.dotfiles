-- Set leader key to Space
vim.g.mapleader = " "

-- Create a shortcut for remapping options
local opts = { noremap = true, silent = true }
local map = vim.keymap.set -- Helper function to set key mappings

-- Keybindings

-- Delete character under cursor without affecting the clipboard
map("n", "x", '"_x')

-- In insert mode, pressing "jj" will escape to normal mode
-- map("i", "jj", "<Esc>")

-- Move selected lines up and down in visual mode (keep selection)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Don't move cursor to the end when joining lines in normal mode
map("n", "J", "mzJ`z")

-- Jump between matching parentheses/brace/bracket
map("n", "<Tab>", "%")

-- Keep cursor in the center of the screen while scrolling
map("n", "<C-u>", "<C-u>zz", opts) -- Scroll up and keep cursor centered
map("n", "<C-d>", "<C-d>zz", opts) -- Scroll down and keep cursor centered

-- Other cursor-centering navigation when jumping between certain elements
map("n", "{", "{zz") -- Jump to previous block and center
map("n", "}", "}zz") -- Jump to next block and center
map("n", "N", "Nzz") -- Jump to next search result and center
map("n", "n", "nzz") -- Jump to previous search result and center
map("n", "G", "Gzz") -- Jump to end of file and center
map("n", "gg", "ggzz") -- Jump to beginning of file and center
map("n", "gd", "gdzz") -- Jump to definition and center

-- Navigate to the previous location with <C-o> and keep the cursor centered
map("n", "<C-o>", "<C-o>zz")

-- Highlight the current match of "%" and center it
map("n", "%", "%zz")

-- Search for next/previous match of "*" and center the result
map("n", "*", "*zz")
map("n", "#", "#zz")

-- Find and replace the word under the cursor with the same word using `leader+s`
map("n", "<leader>s", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>" -- Build the replace command
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true) -- Translate the command into usable keys
	vim.api.nvim_feedkeys(keys, "n", false) -- Execute the command
end)

-- Buffer navigation with leader key:
map("n", "L", ":bnext<CR>", opts) -- Move to the next buffer
map("n", "H", ":bprevious<CR>", opts) -- Move to the previous buffer

-- In insert mode, pressing <C-c> will exit insert mode (like ESC)
map("i", "<C-c>", "<Esc>")

-- Jump to the next/previous quickfix list entries and keep the cursor centered
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Make the current file executable with the leader + x shortcut
map("n", "<leader>x", "<cmd>!chmod +x %<CR> <bar> :echo 'chmod permission granted'<CR> ", { silent = true })

-- Window management: open split windows vertically or horizontally
map("n", "sv", "<C-w>v") -- Split window vertically
map("n", "ss", "<C-w>s") -- Split window horizontally
map("n", "sx", "<C-w><C-o>") -- Close all other windows and focus the current one
map("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear search highlighting when pressing Esc

-- Clipboard management using system clipboard or unnamed registers
map({ "n", "v" }, ";y", [["+y]]) -- Yank (copy) to system clipboard
map({ "n", "v" }, ";d", [["+d]]) -- Delete to system clipboard
map({ "n", "v" }, "<leader>d", [["_d]]) -- Delete to unnamed register (no copy)
map("v", "p", '"_dP', opts) -- Paste the content from the unnamed register without affecting the clipboard

-- Resize window with Ctrl + Arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" }) -- Increase window height
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" }) -- Decrease window height
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" }) -- Decrease window width
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" }) -- Increase window width

-- General commands for file saving and closing
map("n", "<leader>q", "<cmd> q <CR>", opts) -- Quit current buffer
map("n", "<leader>a", "gg<S-v>G", opts) -- Select all content in the file
map("v", "<", "<gv", opts) -- Indent selected text left, preserve selection
map("v", ">", ">gv", opts) -- Indent selected text right, preserve selection

-- C++ compile and run command with address sanitizer enabled
map(
	"n",
	",r",
	':w<CR>:silent !g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o "%<.out" "%" && "./%:t:r.out" < "%:p:h/input.txt" > "%:p:h/output.txt"<CR>',
	opts
)

-- Increment and Decrement numbers
map("n", "<leader>=", "<C-a>", { desc = "Increment number" }) -- Increment a number under the cursor
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- Decrement a number under the cursor

-- Show diagnostic in floating window
map("n", ";e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Toggle between next and previous buffers
map("n", ";n", ":bnext <CR>")
map("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
map("n", "<leader>odt", ":ObsidianTemplate task<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
map("n", "<leader>ot", ":ObsidianTemplate title<cr>")

-- Search for files in your Obsidian vault directory
map("n", "<leader>os", ':Telescope find_files search_dirs={"/mnt/drive2/obsidian-notes"}<cr>')
map("n", "<leader>oz", ':Telescope live_grep search_dirs={"/mnt/drive2/obsidian-notes"}<cr>')

-- Save current file with <C-s>
map("n", "<C-s>", "<cmd> w <CR>", opts)

-- Close current buffer with <C-w>
map("n", "<C-w>", "<cmd> bd <CR>", opts)

-- Copy the title of the current file to clipboard
map("n", "YY", "va{Vy", opts)

-- Close all folds
map("n", "<leader>fc", ":foldclose<CR>")

-- Open all folds
map("n", "<leader>fo", ":foldopen<CR>")

-- Close all folds in buffer
map("n", "<leader>fC", "zM")

-- Open all folds in buffer
map("n", "<leader>fO", "zR")

-- Toggle fold under cursor
map("n", "<leader>ft", "za")
