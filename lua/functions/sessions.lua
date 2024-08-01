-- Dependencies
local paths = require("functions.path")
local hash = require("functions.hash")

-- Get the home directory
local home = os.getenv("HOME")

-- Define the session directory
local session_dir = home .. "/.local/share/nvim/sessions"

-- Get the root directory and hash it
local root = paths.get_project_root()
local session_name = hash.sha1sum(root)
local session_file = session_dir .. "/" .. session_name .. ".vim"

-- Ensure session directory exists
local function ensure_session_dir()
  if vim.fn.isdirectory(session_dir) == 0 then
    vim.fn.mkdir(session_dir, "p")
  end
end

-- Save session
local function save()
  ensure_session_dir()
  vim.cmd("mksession! " .. session_file)
  print("Session saved to " .. session_file)
end

-- Load session
local function load()
  if vim.fn.filereadable(session_file) == 1 then
    vim.cmd("source " .. session_file)
  else
    print("No session found to load.")
  end
end

-- Return module table
return {
  save = save,
  load = load,
}
