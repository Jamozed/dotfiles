-- Config file for Neovim
-- Located in ~/.config/nvim

vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.cpoptions = "I" -- Do not delete autoindents
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "syntax"
vim.opt.history = 1000
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.synmaxcol = 240 -- Process syntax up to 240 columns
vim.opt.syntax = "enable"
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undofile = true

require("paq") {
	"hoob3rt/lualine.nvim",
	"morhetz/gruvbox",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"savq/paq-nvim",
}

require("lualine").setup({ options = { icons_enabled = false }})

vim.g["gruvbox_contrast_dark"] = "hard"
vim.cmd("autocmd vimenter * ++nested colorscheme gruvbox")

vim.cmd("nnoremap <Leader>ff <Cmd>Telescope find_files<CR>")
vim.cmd("nnoremap <Leader>fg <Cmd>Telescope live_grep<CR>")
vim.cmd("nnoremap <Leader>fb <Cmd>Telescope buffers<CR>")
vim.cmd("nnoremap <Leader>fh <Cmd>Telescope help_tags<CR>")
