-- Initialize vim-plug and set the plugin installation path
vim.fn['plug#begin']('~/.config/nvim/plugged')

-- Add the Monokai color scheme plugin
vim.fn['plug#']('crusoexia/vim-monokai')

-- Add the Gruvbox color scheme plugin
vim.fn['plug#']('morhetz/gruvbox')

-- Add NvimTree plugin
vim.fn['plug#']('kyazdani42/nvim-tree.lua')
vim.fn['plug#']('kyazdani42/nvim-web-devicons') -- For file icons

-- Add fugitive plugin
vim.fn['plug#']('tpope/vim-fugitive')

-- Add gv.vim
vim.fn['plug#']('junegunn/gv.vim')

-- End vim-plug setup
vim.fn['plug#end']()

-- NvimTree Setup
require'nvim-tree'.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

-- Colorful Fugitive Status Line
vim.cmd [[
function! MyFugitiveStatusline()
  let l:status = FugitiveStatusline()
  if l:status != ''
    let l:status = substitute(l:status, ':\zs.*', '\0', '')
    let l:status = substitute(l:status, ':', '%#DiffChange#&%#Normal#', '')
    let l:status = substitute(l:status, 'master', '%#DiffText#&%#Normal#', '')
  endif
  return l:status
endfunction
]]

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set the number of lines to show above and below the cursor
vim.opt.scrolloff = 5

-- Enable mouse support
vim.opt.mouse = "a"

-- Set the clipboard to use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- Enable line wrapping
vim.opt.wrap = true

-- Set the tab size to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Enable auto-indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Enable line numbers and status line
vim.opt.number = true
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

-- Set the Gruvbox color scheme
vim.cmd("colorscheme gruvbox")

-- Enable fugitive status bar
vim.opt.statusline = '%<%f %h%m%r %{MyFugitiveStatusline()}%=%-14.(%l,%c%V%) %P'

-- Enable relative line numbers in command mode (for Ex commands)
vim.cmd("cnoreabbrev <expr> [0-9]\\+ (v:count1 - 1)")

-- 3. Keybindings
vim.g.mapleader = ' '

-- NvimTree keybindings
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- 4. Plugin Configuration

-- NvimTree configuration
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_auto_ignore_ft = {}
vim.g.nvim_tree_quit_on_open = 1
