-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd([[colorscheme onedark]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "t" }, "<C-j>", "<C-w>j", { silent = true, noremap = true })
vim.keymap.set({ "n", "t" }, "<C-k>", "<C-w>k", { silent = true, noremap = true })
vim.keymap.set({ "n", "t" }, "<C-h>", "<C-w>h", { silent = true, noremap = true })
vim.keymap.set({ "n", "t" }, "<C-l>", "<C-w>l", { silent = true, noremap = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
local ft_group = vim.api.nvim_create_augroup("_MyFileType", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = ft_group,
	pattern = { "qf", "help", "man", "lspinfo" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close<cr>", { silent = true, buffer = 0 })
	end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = ft_group,
	pattern = { "qf" },
	command = "set nobuflisted",
})
local wrap_and_spell_fts = { "gitcommit", "markdown" }
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = ft_group,
	pattern = wrap_and_spell_fts,
	command = "set wrap",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = ft_group,
	pattern = wrap_and_spell_fts,
	command = "set spell",
})
local auto_resize_group = vim.api.nvim_create_augroup("_MyAutoResize", { clear = true })
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = auto_resize_group,
	pattern = { "*" },
	command = "tabdo wincmd =",
})

vim.api.nvim_create_user_command("BufOnly", "<cmd>%bd|e#<cr>", { desc = "Close all other buffers" })