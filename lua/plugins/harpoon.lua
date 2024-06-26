local wk = require("which-key")
wk.register({
  m = {
    name = "marked files",
  },
}, { prefix = "<leader>" })

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "File marks",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

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
      "<leader>fm",
      function()
        local harpoon = require("harpoon")
        toggle_telescope(harpoon:list())
      end,
      mode = { "n" },
      desc = "Marked files",
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
