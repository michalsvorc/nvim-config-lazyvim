local wk = require("which-key")
wk.add({
  { "<leader>S", group = "Session" },
})

---@type LazySpec
return {
  "echasnovski/mini.sessions",
  version = "*",
  lazy = false,
  config = function()
    local home = os.getenv("HOME")
    local session_dir = home .. "/.local/share/nvim/sessions"
    local root = LazyVim.root.get({ normalize = true })
    local hash = require("functions.hash")
    local session_name = hash.sha1sum(root)
    local config = {
      -- Whether to read latest session if Neovim opened without file arguments
      autoread = true,

      -- Whether to write current session before quitting Neovim
      autowrite = true,

      -- Directory where global sessions are stored (use `''` to disable)
      directory = session_dir, --<"session" subdir of user data directory from |stdpath()|>,

      -- File for local session (use `''` to disable)
      file = nil,

      -- Whether to force possibly harmful actions (meaning depends on function)
      force = { read = false, write = true, delete = false },

      -- Hook functions for actions. Default `nil` means 'do nothing'.
      hooks = {
        -- Before successful action
        pre = { read = nil, write = nil, delete = nil },
        -- After successful action
        post = { read = nil, write = nil, delete = nil },
      },

      -- Whether to print session path after action
      verbose = { read = false, write = true, delete = true },
    }
    require("mini.sessions").setup(config)

    vim.api.nvim_create_user_command("SessionSave", function()
      require("mini.sessions").write(session_name)
    end, {})

    vim.api.nvim_create_user_command("SessionLoad", function()
      require("mini.sessions").read(session_name)
    end, {})
  end,
  keys = {
    {
      "<leader>Ss",
      "<cmd>SessionSave<cr>",
      desc = "Session Save",
    },
    {
      "<leader>Sl",
      "<cmd>SessionLoad<cr>",
      desc = "Session Load",
    },
  },
}
