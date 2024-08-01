vim.api.nvim_create_user_command("SessionSave", function()
  require("functions.sessions").save()
end, {})

vim.api.nvim_create_user_command("SessionLoad", function()
  require("functions.sessions").load()
end, {})
