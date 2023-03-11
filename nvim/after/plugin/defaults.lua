vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.o.guifont = "Rec Mono Casual,Fira Code Nerd Font:h18"
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
-- vim.g.neovide_fullscreen = false
if vim.g.neovide then
  vim.keymap.set({'n', 'v', 'i'}, '<M-enter>', function ()
    vim.g.neovide_fullscreen = (not vim.g.neovide_fullscreen)
  end, { desc = 'Toggle neovide fullscreen', silent = true})
end

vim.keymap.set('n', '<leader>rr', function ()
  vim.cmd([[
    source $MYVIMRC
    runtime! plugin/**/*.vim
    runtime! plugin/**/*.lua
    runtime! after/**/*.vim
    runtime! after/**/*.lua
  ]])
end, { desc = 'Reload configs and plugins', silent = true})

