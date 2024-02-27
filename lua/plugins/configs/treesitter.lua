local options = {
  ensure_installed = { "lua", "vim", "elixir", "eex", "heex" },
  auto_install = true,
  sync_install = false,
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
