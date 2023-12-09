return {
  "luukvbaal/nnn.nvim",
  config = function()
    require("nnn").setup({
      picker = {
        cmd = "tmux new-session nnn -aDeHixPp",
        style = {
          width = 0.8,
          height = 0.9,
          border = "rounded",
        },
      },
    })
  end,
}
