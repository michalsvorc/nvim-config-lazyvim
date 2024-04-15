return {
  "trevarj/telescope-tmux.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { "fxs", "<cmd>Telescope tmux sessions<CR>", mode = { "n" }, desc = "Tmux sessions" },
    { "fxw", "<cmd>Telescope tmux windows<CR>", mode = { "n" }, desc = "Tmux windows" },
    { "fxc", "<cmd>Telescope tmux pane_contents<CR>", mode = { "n" }, desc = "Tmux pane contents" },
    { "fxf", "<cmd>Telescope tmux pane_file_paths<CR>", mode = { "n" }, desc = "Tmux file paths" },
  },
}
