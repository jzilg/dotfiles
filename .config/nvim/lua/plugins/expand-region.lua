return {
  "terryma/vim-expand-region",
  keys = {
    { "<M-Up>", "<Plug>(expand_region_expand)", mode = { "n", "x" }, desc = "Expand selection" },
    { "<M-Down>", "<Plug>(expand_region_shrink)", mode = { "n", "x" }, desc = "Shrink selection" },
  },
  config = function()
    vim.g.expand_region_text_objects = {
      ["iw"] = 0, -- inner word (respects camelCase and underscores)
      ["iW"] = 0, -- inner WORD (continuous non-whitespace, ignores camelCase/underscores)
      ['i"'] = 0, -- inner double-quoted string
      ["i'"] = 0, -- inner single-quoted string
      ["i]"] = 1, -- inner square brackets [ ... ]
      ["ib"] = 1, -- inner parentheses ( ... )
      ["iB"] = 1, -- inner curly braces { ... }
      ["il"] = 1, -- inner line (text inside the current line)
      ["it"] = 0, -- inner tag (HTML/XML/JSX)
      ["ip"] = 0, -- inner paragraph
      ["ie"] = 1, -- inner sentence (textobj-sentence)
      ["al"] = 1, -- around line
      ["a]"] = 1, -- around square brackets [ ... ]
      ["ab"] = 1, -- around parentheses ( ... )
      ["aB"] = 1, -- around curly braces { ... }
      -- ["ii"] = 1, -- inner indent block (requires vim-textobj-indent)
      ["ai"] = 1, -- around indent block (requires vim-textobj-indent)
      ["at"] = 1, -- around tag (HTML/XML/JSX)
    }
  end,
}
