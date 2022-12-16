M = {}
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation --
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize with arrows --
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Beginning/End of the Line.
keymap("n", "<C-H>", "^", opts)
keymap("n", "<C-L>", "$", opts)

-- Activate true-zen mode. --
keymap("n", "zt", ":TZFocus<CR>", opts)
keymap("n", "zm", ":TZMinimalist<CR>", opts)
keymap("n", "za", ":TZAtaraxis<CR>", opts)
keymap("n", "zn", ":TZNarrow<CR>", opts)
keymap("v", "zn", ":'<,'>TZNarrow<CR>", opts)

-- Undotree --
keymap("n", "<Leader>u", ":UndotreeShow<CR>", opts)

-- Quit --
keymap("n", "<leader>q", ":Bdelete<CR>", opts)

-- QuickFix List --
keymap("n", "<C-o>", ":copen<CR>", opts)
keymap("n", "<C-q>", ":cclose<CR>", opts)
keymap("n", "<C-k>", ":cprev<CR>", opts)
keymap("n", "<C-j>", ":cnext<CR>", opts)

-- LocalFix List --
keymap("n", "<S-l>", ":lopen<CR>", opts)
keymap("n", "<S-q>", ":lclose<CR>", opts)
keymap("n", "<S-j>", ":lnext<CR>", opts)
keymap("n", "<S-k>", ":lprevious<CR>", opts)

-- Indent the Whole buffer
keymap("n", "<F10>", "ggVG=<C-o>", opts)

-- Telescope
keymap("n", "<Leader>ts", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>tw", ":Telescope grep_string<CR>", opts)
keymap("n", "<Leader>tf", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>te", ":Telescope git_files<CR>", opts)
keymap("n", "<Leader>tc", ":Telescope git_commits previewer=false<CR><CR>", opts)
keymap("n", "<Leader>to", ":Telescope oldfiles<CR>", opts)
keymap("n", "<Leader>tp", ":Telescope projects<CR>", opts)
keymap("n", "<Leader>tb", ":Telescope buffers<CR>", opts)
keymap("n", "<Leader>tr", "<cmd>Telescope resume<cr>", opts)

-- Fugitive
keymap("n", "<Leader>gs", ":G<CR>", opts)
keymap("n", "<Leader>gl", ":Gclog<CR>", opts)
keymap("n", "<Leader>gb", ":Git blame<CR>", opts)
keymap("n", "<Leader>gc", ":Git commit<CR>", opts)
keymap("n", "<Leader>gp", ":Git push<CR>", opts)
keymap("n", "<Leader>gf", ":Git fetch --all<CR>", opts)
keymap("n", "<Leader>gm", ":Git merge<CR>", opts)

-- Rename your file on disk, in git repo, reload it and preserve undo history.
keymap("n", "<Leader>gn", ":GMove", opts)

--[[ If you want add a file to the .gitignore from the gitstatus window, just
press any number followd by g and I then save&quit the .gitignore. ]]

--[[ When trying to resolve merge conflicts, check the status then go to
the unstaged file with the conflict and press dv.
You shall see 3 sides.
The first one is the file on your local branch.
The last one is the file from the repo.
The one in the middle is the result file.
Once you're finished do ctrl+w ctrl+o. ]]

--[[ When trying to resolve merge conflicts, check the status then if you only
want the repo file to replace the local file then press X then s.
But if you the local file over the repo's one then press x then s. ]]

-- Choose which side to pick from Right or Left when resolving merge conflicts
keymap("n", "<Leader>ga", ":diffget //2<CR>", opts)
keymap("n", "<Leader>g;", ":diffget //3<CR>", opts)

-- New Lines + leave insert mode
keymap("n", "<Leader>o", "o<ESC>k", opts)
keymap("n", "<M-o>", "O<ESC>j", opts)

-- Fn to show_documentation of anything. --
M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end
keymap("n", "<Leader>sd", ":lua require('user.keymaps').show_documentation()<CR>", opts)

-- Insert --
-- Press jk to leave insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Go to the end or the beggining of the line.
keymap("i", "<C-a>", "<ESC>A", opts)
keymap("i", "<C-i>", "<ESC>I", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Press jk to leave insert mode
keymap("v", "jk", "<ESC>", opts)
keymap("v", "kj", "<ESC>", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- Paste the content from the _dP. --
keymap("v", "p", '"_dP', opts)

-- Paste the content from the insert_mode clipboard. --
keymap("v", "<S-.>", '"7d".P', opts)

return M
