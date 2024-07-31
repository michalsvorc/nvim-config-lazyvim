local hash = {}

-- Function to generate SHA-1 hash of a given input string using system command
function hash.sha1sum(input)
  local handle = io.popen("echo -n " .. input .. " | sha1sum")
  if handle == nil then
    error("Failed to run sha1sum command")
  end

  local result = handle:read("*a")
  handle:close()

  if result == nil then
    error("Failed to read sha1sum result")
  end

  -- Extract the hash from the result
  return result:match("%w+")
end

return hash
