-- options 
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- opt.gcr = ""
opt.conceallevel = 0
opt.background = "dark"
opt.number = true
vim.o.undodir = "/home/vscoder/.undodir"
opt.undofile = true

-- tabs & indentation
opt.rnu = true
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)

opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.wrap = false
opt.swapfile = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.smartindent = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.incsearch = true
opt.foldmethod = indent

opt.scrolloff = 10
opt.updatetime = 50
opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.colorcolumn = "90"
-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.clipboard = ""
vim.opt.splitkeep = "cursor"
vim.opt.cursorline = true
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.shortmess:append("c") -- Don't give |ins-completion-menu| messages (default: does not include 'c')
vim.opt.iskeyword:append("-") -- Hyphenated words recognized by searches (default: does not include '-')
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)
vim.o.hlsearch = false -- Set highlight on search (default: true)
vim.o.linebreak = true
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})



