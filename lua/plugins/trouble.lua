---@type LazySpec
return {
  "folke/trouble.nvim",
  opts = {
    preview = {
      type = "main",
      scratch = false,
    },
    keys = {
      s = false,
      S = {
        action = function(view)
          local f = view:get_filter("severity")
          local severity = ((f and f.filter.severity or 0) + 1) % 5
          view:filter({ severity = severity }, {
            id = "severity",
            template = "{hl:Title}Filter:{hl} {severity}",
            del = severity == 0,
          })
        end,
        desc = "Toggle Severity Filter",
      },
    },
  },
  keys = {
    {
      "<leader>cs",
      function()
        vim.cmd("Trouble symbols toggle win.size=60")
      end,
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cS",
      function()
        vim.cmd("Trouble lsp toggle win.size=0.33")
      end,
      desc = "LSP refs (Trouble)",
    },
  },
}
