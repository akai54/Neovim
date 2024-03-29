local status_ok, better_escape = pcall(require, "better_escape")
if not status_ok then
  return
end

better_escape.setup {
  mapping = { "jk", "JK", "kj", "KJ" }, -- a table with mappings to use
  timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
  clear_empty_lines = true, -- clear line after escaping if there is only whitespace
  keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
}
