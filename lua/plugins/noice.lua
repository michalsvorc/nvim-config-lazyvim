---@type LazySpec
return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      enabled = false, -- enables the Noice cmdline UI
      view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    },
    popupmenu = {
      enabled = false, -- enables the Noice popupmenu UILeave
    },
    messages = {
      enabled = false,
    },
  },
}
