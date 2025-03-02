-- Setup language servers.
local lspconfig = require('lspconfig')

-- The Language Servers:
lspconfig.rust_analyzer.setup{
  -- Server-specific settings. See `:help lspconfig-setup`
  cmd = { "/Users/niklas/.cargo/bin/rust-analyzer" },
  settings = {
    ['rust-analyzer'] = {},
  },
}

lspconfig.zls.setup {
    on_attach = function()
        vim.g.zig_fmt_autosave = 0
    end,

  -- Server-specific settings. See `:help lspconfig-setup`

  -- There are two ways to set config options:
  --   - edit your `zls.json` that applies to any editor that uses ZLS
  --   - set in-editor config options with the `settings` field below.
  --
  -- Further information on ZLS config options:
  -- https://github.com/zigtools/zls#configuration-options
  settings = {
  }
}

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

lspconfig.clangd.setup{}


-- lspconfig.perlnavigator.setup{
--     settings = {
--         perlnavigator = {
--             enableWarnings = true,
--             cmd = {'node', '/home/niklas/weichware/PerlNavigator/server/out/server.js', '--stdio'},
--             perlPath = '/usr/bin/perl',
--         }
--     }
-- }
-- local perlconfig = {
--     cmd = { "/home/niklas/perl5/bin/pls" },
--     settings = {
--         pls = {
--             --cwd = {"/home/niklas/frequenzgithub/gateway-install"}
--         }
--     },
-- }
-- lspconfig.perlpls.setup(perlconfig)
-- lspconfig.sourcekit.setup {}





-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})



