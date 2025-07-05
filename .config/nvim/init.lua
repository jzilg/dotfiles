vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = true

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.lua",
    "*.json",
    "*.ts",
    "*.tsx",
    "*.js",
    "*.jsx",
    "*.css",
  },
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

require("config.lazy")
