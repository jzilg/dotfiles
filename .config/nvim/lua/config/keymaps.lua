-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "gC", function()
  local word = vim.fn.expand("<cword>")
  require("telescope.builtin").grep_string({
    search = "." .. word,
    glob_pattern = "*.css",
  })
end, { desc = "Search CSS class definition" })

vim.keymap.set("n", "gH", function()
  local word = vim.fn.expand("<cword>")
  require("telescope.builtin").grep_string({
    search = 'class="' .. word .. '"|className="' .. word .. '"',
    glob_pattern = "*.{html,jsx,tsx}",
  })
end, { desc = "Find HTML usage of CSS class" })
