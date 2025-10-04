-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "gC", function()
  local fileType = vim.bo.filetype
  local word = vim.fn.expand("<cword>")

  if fileType == "css" or fileType == "scss" or fileType == "sass" then
    require("telescope.builtin").grep_string({
      search = 'class="' .. word .. '"|className="' .. word .. '"',
      glob_pattern = "*.{html,jsx,tsx}",
    })
  elseif fileType == "html" or fileType == "javascriptreact" or fileType == "typescriptreact" then
    require("telescope.builtin").grep_string({
      search = "." .. word,
      glob_pattern = "*.{css,scss,sass}",
    })
  else
    vim.cmd("normal! gd")
  end
end, { desc = "Find usage of CSS class" })
