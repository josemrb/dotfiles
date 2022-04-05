-- use explicit global var _G
_G.has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

_G.set_buffer_keymap = function(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == "string" then opts[i] = v end
  end

  vim.api.nvim_buf_set_keymap(key[1], key[2], key[3], key[4], opts)
end

_G.set_keymap = function(table)
  local default_opts = {noremap = true}
  local extracted_opts = {}
  for key, val in pairs(table) do
    if type(key) == "string" then
      extracted_opts[key] = val
    elseif type(key) == "table" then
      default_opts = val
    end
  end

  local opts = vim.tbl_extend("keep", extracted_opts, default_opts)

  vim.api.nvim_set_keymap(table[1], table[2], table[3], opts)
end

_G.set_opt = function(table)
  for k, v in pairs(table) do
    vim.opt[k] = v
  end
end

_G.t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
