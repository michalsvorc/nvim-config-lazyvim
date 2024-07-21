require("which-key").add({
  { "<leader>m", group = "marked files" },
})

local function select_from_list(index)
  local harpoon = require("harpoon")
  harpoon:list():select(index)
end

---@type LazySpec
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
  end,
  keys = {
    {
      "<leader>ma",
      function()
        require("harpoon"):list():add()
      end,
      mode = { "n" },
      desc = "Add mark",
    },
    {
      "<leader>mm",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      mode = { "n" },
      desc = "Menu",
    },
    {
      "<leader>mj",
      function()
        require("harpoon"):list():next()
      end,
      mode = { "n" },
      desc = "Navigate next",
    },
    {
      "<leader>mk",
      function()
        require("harpoon"):list():prev()
      end,
      mode = { "n" },
      desc = "Navigate previous",
    },
    {
      "<leader>m1",
      function()
        select_from_list(1)
      end,
      mode = { "n" },
      desc = "Select mark 1",
    },
    {
      "<leader>m2",
      function()
        select_from_list(2)
      end,
      mode = { "n" },
      desc = "Select mark 2",
    },
    {
      "<leader>m3",
      function()
        select_from_list(3)
      end,
      mode = { "n" },
      desc = "Select mark 3",
    },
    {
      "<leader>m4",
      function()
        select_from_list(4)
      end,
      mode = { "n" },
      desc = "Select mark 4",
    },
    {
      "<leader>m5",
      function()
        select_from_list(5)
      end,
      mode = { "n" },
      desc = "Select mark 5",
    },
    {
      "<leader>m6",
      function()
        select_from_list(6)
      end,
      mode = { "n" },
      desc = "Select mark 6",
    },
    {
      "<leader>m7",
      function()
        select_from_list(7)
      end,
      mode = { "n" },
      desc = "Select mark 7",
    },
    {
      "<leader>m8",
      function()
        select_from_list(8)
      end,
      mode = { "n" },
      desc = "Select mark 8",
    },
    {
      "<leader>m9",
      function()
        select_from_list(9)
      end,
      mode = { "n" },
      desc = "Select mark 9",
    },
  },
}
