-- local colorscheme = "darkplus"
local colorscheme = "gruvbox-material"
vim.o.background = "dark"
vim.g.gruvbox_material_background = "hard"

--vim.g.onedarker_italic_keywords = false

--vim.g.onedarker_italic_functions = false

--vim.g.onedarker_italic_comments = true

--vim.g.onedarker_italic_loops = false

--vim.g.onedarker_italic_conditionals = false

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    return
end
