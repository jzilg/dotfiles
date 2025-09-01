return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    -- make find git files the default find command
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").git_files({
          show_untracked = true, -- optional: shows untracked files which are not ignored
        })
      end,
      desc = "Find Git Files",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
}
