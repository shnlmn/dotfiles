-- Set  <space> as the leader
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- load my remaps and sets
require("shnlmn")
-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--  as they will be available in your neovim runtime.
require('lazy').setup("plugins")

-- [[ Highlight on yank ]]
--
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_augroup("WorkingDirectory", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  print("Make current directory the working directory"),
  pattern = "*",
  callback = function()
    if vim.fn.expand("%:t") == "" then
      vim.cmd([[cd %:p:h]])
      print("Changed to directory: " .. vim.fn.expand("%:p:h"))
    else
      print("No file opened. Working Directory is " .. vim.fn.getcwd())
    end
  end,
  group = "WorkingDirectory",
})

