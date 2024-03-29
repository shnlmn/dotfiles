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

vim.keymap.set('n', '<leader>fs', vim.cmd.NERDTree, { desc = 'Open File browser' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Naviation
vim.keymap.set('n', '<C-d>', "<C-d>zz", { desc = "Jump 1/2 page down and center" })
vim.keymap.set('n', '<C-u>', "<C-u>zz", { desc = "Jump 1/2 page up and center" })

-- Format Document
vim.keymap.set('n', '<leader>ff', ":Format<CR>", { desc = 'Format Document' })

-- Cure for dyslexia, move a character left or right
vim.keymap.set('n', "<C-l>", "\"zx\"zp", { desc = "Move character under cursor to the right" })
vim.keymap.set('n', "<C-h>", "\"zxh\"zP", { desc = "Move character under cursor to the right" })

-- Remap to paste from _ register
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = "Paste from _ register" })
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to system clipboard" })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete to blackhole register" })
