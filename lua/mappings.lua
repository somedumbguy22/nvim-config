require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Added by Aakash
-- This toggles the diagnostics information into a floating buffer for better visibility
-- (in case the message goes off screen, this can be helpful)
-- This maps to <leader> + k
-- credit: https://www.reddit.com/r/neovim/comments/11axh2p/how_to_toggle_openclose_floating_lsp_diagnostic/
map("n", '<leader>k', function()
  -- If we find a floating window, close it.
  local found_float = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= '' then
      vim.api.nvim_win_close(win, true)
      found_float = true
    end
  end

  if found_float then
    return
  end

  vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
end, { desc = 'Toggle Diagnostics' })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
