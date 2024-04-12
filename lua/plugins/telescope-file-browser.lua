return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>sf",
      function()
        require("telescope").extensions.file_browser.file_browser()
      end,
      desc = "File browser",
    },
    {
      "<leader>sF",
      function()
        require("telescope").extensions.file_browser.file_browser({
          path = vim.fn.expand("%:p:h"),
          select_buffer = true,
        })
      end,
      desc = "File browser (cwd)",
    },
  },
}
