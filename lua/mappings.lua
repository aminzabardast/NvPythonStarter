require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Toggle GitHub Copilot on/off with <leader>ct
map("n", "<leader>ct", function()
  -- prefer the plugin's enable/disable functions when available
  local enabled = vim.g.copilot_enabled
  if enabled == nil then
    enabled = true
  end
  enabled = not enabled
  vim.g.copilot_enabled = enabled

  if enabled then
    if vim.fn.exists('*copilot#Enable') == 1 then
      pcall(vim.fn['copilot#Enable'])
    end
    vim.notify("Copilot enabled", vim.log.levels.INFO)
  else
    if vim.fn.exists('*copilot#Disable') == 1 then
      pcall(vim.fn['copilot#Disable'])
    end
    vim.notify("Copilot disabled", vim.log.levels.WARN)
  end
end, { desc = "Toggle Copilot (enable/disable)" })
