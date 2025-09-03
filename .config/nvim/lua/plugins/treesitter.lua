return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<M-CR>", -- Option + Enter
          node_incremental = "<M-Up>", -- Option + Keyup
          node_decremental = "<M-Down>", -- Option + Keydown
        },
      },
    },
  },
}
