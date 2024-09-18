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
    completion = {
      autocomplete = false,
    },
  },
  config = function(_, opts)
    -- disable completion in cmp
    -- to use alongside neocodeium
    local cmp = require("cmp")
    local neocodeium = require("neocodeium")

    cmp.event:on("menu_opened", function()
      neocodeium.clear()
    end)

    neocodeium.setup({
      filter = function()
        return not cmp.visible()
      end,
    })

    cmp.setup(opts)
  end,
  -- stylua: ignore
  keys = {
    { "<A-f>", function() require("neocodeium").accept() end, mode = "i" },
    { "<A-w>", function() require("neocodeium").accept_word() end, mode = "i" },
    { "<A-a>", function() require("neocodeium").accept_line() end, mode = "i" },
    { "<A-e>", function() require("neocodeium").cycle_or_complete() end, mode = "i" },
    { "<A-r>", function() require("neocodeium").cycle_or_complete(-1) end, mode = "i" },
    { "<A-c>", function() require("neocodeium").clear() end, mode = "i" },
  },
}
