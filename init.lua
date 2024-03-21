

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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
     dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
