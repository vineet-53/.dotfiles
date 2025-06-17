-- options
vim.cmd("let g:netrw_liststyle = 3") -- Set the list style for Netrw (Netrw is a file explorer plugin)
-- 3 means to show the list of files with detailed information

local opt = vim.opt -- Shortcut to access Neovim's options via `vim.opt` (more efficient)

-- General settings
opt.termguicolors = true -- Enable 24-bit RGB color in the terminal (for better color support)
opt.gcr = "" -- Set cursor settings, this might need a valid value if you are using a GUI
opt.conceallevel = 0 -- Disable text concealment (so all characters are shown, e.g., for markdown)
opt.background = "dark" -- Set the background color of Neovim to dark (affects color schemes)
opt.number = true -- Show line numbers in the left margin (useful for navigation and reference)
opt.undodir = "/home/coder/.undodir" -- Set the directory for storing undo history
opt.undofile = true -- Enable persistent undo (undo history is saved to disk, survives editor restart)

-- Tabs & indentation settings
opt.rnu = true -- Enable relative line numbering (numbers lines relative to the current line)
opt.tabstop = 4 -- Set the number of spaces that a Tab character represents (tab width)
opt.shiftwidth = 2 -- Set the number of spaces to insert when indenting (default is 8, here set to 2)
opt.expandtab = true -- Convert tabs to spaces (tab characters are replaced with spaces)
opt.wrap = false -- Disable line wrapping (long lines will extend beyond the screen rather than wrap)
opt.swapfile = false -- Disable swap files (can help reduce file bloat, but use cautiously)

-- Search settings
opt.ignorecase = true -- Ignore case when searching (e.g., 'foo' will match 'Foo', 'FOO', etc.)
opt.smartcase = true -- If search includes uppercase letters, make search case-sensitive
opt.smartindent = true -- Automatically indent new lines based on context (for languages with braces)
opt.incsearch = true -- Incrementally highlight matching text as you type a search pattern
opt.foldmethod = "manual" -- Set the folding method to "indent", so folding is based on indentation level

-- Miscellaneous settings
opt.scrolloff = 10 -- Keep 10 lines visible above and below the cursor while scrolling
opt.updatetime = 50 -- Set the time (in milliseconds) for Neovim to wait before triggering events like `CursorHold`
opt.termguicolors = true -- Enable 24-bit true color support in terminal (useful for color schemes)
opt.signcolumn = "yes" -- Always show the sign column (prevents shifting text when adding or removing signs)
opt.colorcolumn = "90" -- Highlight the column at position 90 (good for limiting line length in code)

-- Split window behavior
opt.splitright = true -- Open vertical splits to the right of the current window (default is to the left)
opt.splitbelow = true -- Open horizontal splits below the current window (default is above)

-- Clipboard settings
vim.opt.clipboard = "" -- Use the system clipboard (allows copying/pasting between Neovim and other apps)

-- Split keep behavior
vim.opt.splitkeep = "cursor" -- When splitting windows, keep the cursor position in the current window
vim.opt.cursorline = true -- Highlight the line the cursor is on (helps with focus in the editor)

-- Format options
vim.opt.formatoptions:remove("r") -- Remove the default behavior of formatting comments on new lines
vim.opt.shortmess:append("c") -- Suppress unnecessary completion messages (e.g., `|ins-completion-menu|`)
vim.opt.iskeyword:append("-") -- Include hyphenated words as keywords (useful for searching hyphenated terms)

-- Show mode (INSERT, NORMAL, etc.)
opt.showmode = false -- Disable showing the mode (like -- INSERT --) in the status line (unnecessary in modern setups)

-- Search highlighting
opt.hlsearch = true -- Highlight all matches while searching (helps to see all occurrences of the search term)

-- Line-breaking settings
opt.linebreak = true -- Automatically break lines at word boundaries (helpful for better readability)
vim.opt.backspace = { "indent", "eol", "start" }
