-- ~/.config/nvim/lua/plugins/nvim-lspconfig.lua
-- Neovim 0.11+ style: no require('lspconfig').X.setup()

local config = function()
  -- which-key groups (lean)
  local wk = require('which-key')
  wk.register({
    ['<leader>c'] = { name = '[C]ode' },
    ['<leader>d'] = { name = '[D]ocument' },
    ['<leader>g'] = { name = '[G]it' },
    ['<leader>h'] = { name = 'Git [H]unk' },
    ['<leader>r'] = { name = '[R]ename' },
    ['<leader>s'] = { name = '[S]earch' },
    ['<leader>t'] = { name = '[T]oggle' },
    ['<leader>w'] = { name = '[W]orkspace' },
  })
  wk.register({ ['<leader>h'] = { 'Git [H]unk' } }, { mode = 'v' })

  -- mason (tools installer)
  require('mason').setup()
  -- Ask mason-lspconfig to ensure servers exist (names must match nvim-lspconfig)
  pcall(function()
    require('mason-lspconfig').setup({
      ensure_installed = { 'clangd', 'ts_ls', 'html', 'lua_ls' },
      automatic_installation = true,
    })
  end)

  -- neodev for Lua
  require('neodev').setup()

  -- caps for nvim-cmp
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- on_attach: keys + small tweak
  local on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    local map = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc and ('LSP: ' .. desc) or nil })
    end
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', function()
      vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
    end, '[C]ode [A]ction')
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('gr', require('telescope.builtin').lsp_references,  '[G]oto [R]eferences')
    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    map('K',  vim.lsp.buf.hover, 'Hover')
    map('<M-k>', vim.lsp.buf.signature_help, 'Signature')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('<leader>wa', vim.lsp.buf.add_workspace_folder,   '[W]orkspace [A]dd')
    map('<leader>wr', vim.lsp.buf.remove_workspace_folder,'[W]orkspace [R]emove')
    map('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, '[W]orkspace [L]ist')
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function() vim.lsp.buf.format() end,
      { desc = 'Format current buffer with LSP' })
  end

  -- Server configurations (core API)
  local servers = {
    clangd = {},
    ts_ls  = {},                       -- tsserver is deprecated
    html   = { filetypes = { 'html', 'twig', 'hbs' } },
    lua_ls = {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          -- diagnostics = { disable = { 'missing-fields' } },
        },
      },
    },
  }

  -- Define + enable each server with vim.lsp.config/enable
  for name, cfg in pairs(servers) do
    cfg.capabilities = capabilities
    cfg.on_attach = on_attach
    vim.lsp.config(name, cfg)     -- register/merge config (uses nvim-lspconfig defaults)
    vim.lsp.enable(name)          -- auto-start when filetype/root matches
  end
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'folke/neodev.nvim',
    'folke/which-key.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = config,
}

