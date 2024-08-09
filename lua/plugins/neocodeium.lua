return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  version = false,
  opts = {
    silent = true,
    filetypes = {
      help = false,
      gitcommit = true,
      gitrebase = false,
      ["."] = false,
    },
  },
  keys = {
    {
      "<A-f>",
      function()
        require("neocodeium").accept()
      end,
      mode = "i",
    },
    {
      "<A-w>",
      function()
        require("neocodeium").accept_word()
      end,
      mode = "i",
    },
    {
      "<A-a>",
      function()
        require("neocodeium").accept_line()
      end,
      mode = "i",
    },
    {
      "<A-e>",
      function()
        require("neocodeium").cycle_or_complete()
      end,
      mode = "i",
    },
    {
      "<A-r>",
      function()
        require("neocodeium").cycle_or_complete(-1)
      end,
      mode = "i",
    },
    {
      "<A-c>",
      function()
        require("neocodeium").clear()
      end,
      mode = "i",
    },
  },
}
