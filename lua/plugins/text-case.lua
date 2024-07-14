require("which-key").add({
  { "<leader>ct", group = "text-case" },
})

---@type LazySpec
return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    {
      "<leader>ct.",
      function()
        require("textcase").start_replacing_command()
      end,
      mode = { "n", "v" },
      desc = "Search commands",
    },
    {
      "<leader>ct/",
      function()
        require("textcase").start_replacing_command_with_part()
      end,
      mode = { "n", "v" },
      desc = "Replace word under cursor",
    },
    {
      "<leader>ctw",
      function()
        require("textcase").replace_word_under_cursor()
      end,
      mode = { "n", "v" },
      desc = "Replace word under cursor",
    },
    {
      "<leader>ctt",
      function()
        require("textcase").open_telescope()
      end,
      mode = { "n", "v" },
      desc = "Search commands",
    },
    {
      "<leader>ctu",
      function()
        require("textcase").lsp_rename("to_upper_case")
      end,
      mode = { "n", "v" },
      desc = "UPPER CASE",
    },
    {
      "<leader>ctl",
      function()
        require("textcase").lsp_rename("to_lower_case")
      end,
      mode = { "n", "v" },
      desc = "lower case",
    },
    {
      "<leader>cts",
      function()
        require("textcase").lsp_rename("to_snake_case")
      end,
      mode = { "n", "v" },
      desc = "snake_case",
    },
    {
      "<leader>ctd",
      function()
        require("textcase").lsp_rename("to_dash_case")
      end,
      mode = { "n", "v" },
      desc = "dash-case",
    },
    {
      "<leader>ctn",
      function()
        require("textcase").lsp_rename("to_constant_case")
      end,
      mode = { "n", "v" },
      desc = "CONSTANT_CASE",
    },
    {
      "<leader>ctd",
      function()
        require("textcase").lsp_rename("to_dot_case")
      end,
      mode = { "n", "v" },
      desc = "dot.case",
    },
    {
      "<leader>cta",
      function()
        require("textcase").lsp_rename("to_phrase_case")
      end,
      mode = { "n", "v" },
      desc = "Phrase case",
    },
    {
      "<leader>ctc",
      function()
        require("textcase").lsp_rename("to_camel_case")
      end,
      mode = { "n", "v" },
      desc = "camelCase",
    },
    {
      "<leader>ctp",
      function()
        require("textcase").lsp_rename("to_pascal_case")
      end,
      mode = { "n", "v" },
      desc = "PascalCase",
    },
    {
      "<leader>cti",
      function()
        require("textcase").lsp_rename("to_title_case")
      end,
      mode = { "n", "v" },
      desc = "Title Case",
    },
    {
      "<leader>ctf",
      function()
        require("textcase").lsp_rename("to_path_case")
      end,
      mode = { "n", "v" },
      desc = "/path/case",
    },
  },
  cmd = {
    "Subs",
    "TextCaseOpenTelescope",
    "TextCaseOpenTelescopeQuickChange",
    "TextCaseOpenTelescopeLSPChange",
    "TextCaseStartReplacingCommand",
  },
}
