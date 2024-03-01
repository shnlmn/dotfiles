-- [[ Basic Keymaps ]]
--
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Buffer Movement
vim.keymap.set('n', '<leader>bn', vim.cmd.bnext)
vim.keymap.set('n', '<leader>bp', vim.cmd.bprevious)
vim.keymap.set('n', '<leader>bl', vim.cmd.buffers)

-- Shift lines
vim.keymap.set('n', '<A-j>', ":m +1<CR>==")
vim.keymap.set('n', '<A-k>', ":m -2<CR>==")
vim.keymap.set('i', '<A-j>', "<Esc>:m +1<CR>==gi")
vim.keymap.set('i', '<A-k>', "<Esc>:m -2<CR>==gi")
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>fs', vim.cmd.NERDTree, { desc = 'Open File browser' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Naviation
vim.keymap.set('n', '<C-d>', "<C-d>zz", { desc = "Jump 1/2 page down and center" })
vim.keymap.set('n', '<C-u>', "<C-u>zz", { desc = "Jump 1/2 page up and center" })