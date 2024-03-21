vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Enable mouse support
vim.opt.mouse = "a"

-- Set the clipboard to use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- Enable line wrapping
vim.opt.wrap = true

-- Enable auto-indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Enable line numbers and status line
vim.opt.laststatus = 2

-- Enable search highlighting as you type
vim.opt.incsearch = true

-- Enable case-insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show line and column number in the status line
vim.opt.ruler = true

-- Enable line continuation
vim.opt.showbreak = "↪ "

-- Save undo history
vim.opt.undofile = true

-- Set backup and swap file options
vim.opt.backup = false
vim.opt.swapfile = false


