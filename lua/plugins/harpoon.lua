local function registerWhichKeyGroup()
  local wk = require("which-key")

  wk.register({
    h = {
      name = "harpoon", -- optional group name
    },
  }, { prefix = "<leader>" })
end

registerWhichKeyGroup()

return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>h", desc = "+harpoon" },
    {
      "<leader>ha",
      function()
        require("harpoon.mark").add_file()
      end,
      mode = { "n" },
      desc = "Add mark",
    },
    {
      "<leader>hh",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      mode = { "n" },
      desc = "Toggle quick menu",
    },
    {
      "<leader>hj",
      function()
        require("harpoon.ui").nav_next()
      end,
      mode = { "n" },
      desc = "Navigate next",
    },
    {
      "<leader>hk",
      function()
        require("harpoon.ui").nav_prev()
      end,
      mode = { "n" },
      desc = "Navigate previous",
    },
    {
      "<leader>fh",
      function()
        require("telescope").extensions.harpoon.marks()
      end,
      mode = { "n" },
      desc = "Harpoon marks",
    },
  },
}
