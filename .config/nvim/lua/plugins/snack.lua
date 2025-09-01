local excluded = {
  ".git",
  ".DS_Store",
  "thumbs.db",
}

return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        -- for snacks fuzzy find but is currently replaced with telescope
        files = {
          hidden = false,
          ignored = false,
          exclude = excluded,
        },
        explorer = {
          enabled = true,
          hidden = true,
          ignored = true,
          exclude = excluded,
        },
      },
    },
  },
}
