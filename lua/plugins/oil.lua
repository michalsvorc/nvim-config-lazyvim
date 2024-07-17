local detail_view = false
local columns_minimal = { "icon" }
local columns_full = { "icon", "permissions", "size", "mtime" }

local toggle_detail_view = {
  desc = "Toggle file detail view",
  callback = function()
    detail_view = not detail_view
    if detail_view then
      require("oil").set_columns(columns_full)
    else
      require("oil").set_columns(columns_minimal)
    end
  end,
}

---@type LazySpec
return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {},
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = columns_minimal,
      delete_to_trash = false,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["gd"] = toggle_detail_view,
        ["gS"] = "actions.change_sort",
        ["<C-q>"] = "actions.send_to_qflist",
        ["<A-q>"] = "actions.add_to_qflist",
      },
    })
  end,
  keys = {
    {
      "<leader>e",
      function()
        require("oil").open()
      end,
      desc = "File explorer",
    },
    {
      "<leader>fe",
      function()
        require("oil").open()
      end,
      desc = "File explorer",
    },
  },
}
