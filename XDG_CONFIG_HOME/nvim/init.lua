-- init.lua
-- Config file for Neovim
-- Located in ~/.config/nvim

vim.opt.clipboard      = "unnamedplus" -- Enable system clipboard support
vim.opt.completeopt    = "menuone,noinsert,noselect"
vim.opt.cpoptions      = "I"           -- Do not delete autoindents
vim.opt.foldlevelstart = 99            -- Begin with all folds open
vim.opt.foldmethod     = "syntax"      -- Use syntax highlighting for folds
vim.opt.history        = 1000          -- Remember 1000 lines of history
vim.opt.ignorecase     = true          -- Ignore case in search patterns
vim.opt.mouse          = "a"           -- Enable mouse support
vim.opt.number         = true          -- Enable line numbers
vim.opt.shiftwidth     = 4             -- Set autoindent width
vim.opt.smartcase      = true          -- Don't ignore case with capitals
vim.opt.smartindent    = true          -- Enable smart indent
vim.opt.splitbelow     = true          -- Split below the current window
vim.opt.splitright     = true          -- Split right from the current window
vim.opt.swapfile       = false         -- Disable swap files
vim.opt.synmaxcol      = 240           -- Process syntax up to 240 columns
vim.opt.syntax         = "enable"      -- Enable syntax highlighting
vim.opt.tabstop        = 4             -- Set tab width
vim.opt.termguicolors  = true          -- Enable 24-bit colour in the TUI
vim.opt.undofile       = true          -- Enable undo files

vim.cmd("inoremap <cr> <cr><left><right>")

require "paq" { "hoob3rt/lualine.nvim", "savq/paq-nvim" }

require("lualine").setup { options = { icons_enabled = false } }
