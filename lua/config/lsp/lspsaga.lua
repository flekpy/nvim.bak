local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)

-- go to definition "gd"
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)

-- в режиме вставке, не понятно как работает
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

-- конфликтует с вставкой в нормальном режиме
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)

-- можно переименовать имя переменной
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
