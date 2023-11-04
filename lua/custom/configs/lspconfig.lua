local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require ("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.csharp_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"cs"},
  init_options = {AutomaticWorkspaceInit = true},
  --root_dir = lspconfig.util.rootpattern("appsettings.json"),
})
