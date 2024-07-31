local key_prefix = "<leader>s"

---@type LazySpec
return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      prefills = {
        search = "",
        replacement = "",
        filesFilter = "!.git/",
        flags = "-.",
      },
    })
  end,
  keys = {
    {
      key_prefix .. "r",
      function()
        require("grug-far").grug_far()
      end,
      mode = "n",
      desc = "FaR",
    },
    {
      key_prefix .. "r",
      function()
        local opts = {
          prefills = {
            search = vim.fn.expand("<cword>"),
          },
        }
        require("grug-far").grug_far(opts)
      end,
      mode = "v",
      desc = "FaR (selection)",
    },
    {
      key_prefix .. "R",
      function()
        local opts = {
          prefills = {
            flags = vim.fn.expand("%"),
          },
        }
        require("grug-far").grug_far(opts)
      end,
      mode = "n",
      desc = "FaR (current buffer)",
    },
    {
      key_prefix .. "R",
      function()
        local opts = {
          prefills = {
            search = vim.fn.expand("<cword>"),
            flags = vim.fn.expand("%"),
          },
        }
        require("grug-far").grug_far(opts)
      end,
      mode = "v",
      desc = "FaR (selection, current buffer)",
    },
  },
}
