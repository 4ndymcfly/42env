-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Mapeo para el comando :Stdheader con la tecla <F1>, hacer un salto de línea y activar modo INSERT.
function InsertHeaderWithNewline()
  vim.cmd('Stdheader')
  vim.cmd('normal! o')
  vim.cmd('startinsert')
end

vim.api.nvim_set_keymap('n', '<F1>', ':lua InsertHeaderWithNewline()<CR>', { noremap = true, silent = true })

-- Mapeo de F2 está asignado a 42 Formatter.

-- Mapear F3 para ejecutar Norminette
vim.api.nvim_set_keymap('n', '<F3>', ':Norminette<CR>', { noremap = true, silent = true })

-- Mapear F4 para cerrar la ventana actual
vim.api.nvim_set_keymap('n', '<F4>', ':q<CR>', { noremap = true, silent = true })

-- Mapear F5 para guardar el documento actual
vim.api.nvim_set_keymap('n', '<F5>', ':w<CR>', { noremap = true, silent = true })

-- Mapear F6 para abrir/cerrar el explorador de NeoTree en el directorio de trabajo actual (cwd)
vim.api.nvim_set_keymap('n', '<F6>', '<cmd>Neotree toggle<CR>', { noremap = true, silent = true })
