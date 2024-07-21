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
}
