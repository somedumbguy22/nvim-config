-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
-- require "lspconfig.configs"

local lspconfig = require "lspconfig"

-- EXAMPLE
-- Be sure to read the appropriate naming convention and
-- match to backend lsp from here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { "html", "cssls", "jsonls", "yamlls", "markdown_oxide" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- lspconfig["elixirls"].setup {
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   on_init = nvlsp.on_init,
--   filetypes = {"ex", "exs"},
--   cmd = { "/home/aakash/.local/share/nvim/mason/packages/elixir-ls/language_server.sh"},
--   -- cmd = { "elixir-ls"},
--   -- settings = {
--   --   dialyzerEnabled = true,
--   --   enableTestLenses = false,
--   --   autoBuild = false,
--   --   fetchDeps = true,
--   -- },
-- }
