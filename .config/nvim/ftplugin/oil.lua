function get_relative_subpath(cwd, subpath)
  -- Remove any trailing slashes from both cwd and subpath for accurate comparison
  cwd = cwd:gsub("/$", "")
  subpath = subpath:gsub("/$", "")

  -- Check if subpath actually starts with cwd
  if subpath:sub(1, #cwd) == cwd then
    -- Special case: when cwd and subpath are the same
    if cwd == subpath then
      return cwd:match("([^/]+)$")
    else
      -- Extract the relative subpath
      local relative_subpath = subpath:sub(#cwd + 2)
      return relative_subpath
    end
  else
    -- Return an error message if subpath is not a subdirectory of cwd
    return "Error: subpath is not a subdirectory of cwd"
  end
end
vim.opt_local.winbar = get_relative_subpath(vim.loop.cwd(), require('oil').get_current_dir())
