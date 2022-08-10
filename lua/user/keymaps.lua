M = {}
local opts = { noremap = true, silent = true }
local optn = { noremap = true, silent = false }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

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

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- I hate typing these
-- keymap("n", "H", "^", opts)
-- keymap("n", "L", "$", opts)
-- keymap("v", "H", "^", opts)
-- keymap("v", "L", "$", opts)
-- keymap("x", "H", "^", opts)
-- keymap("x", "L", "$", opts)
-- keymap("o", "H", "^", opts)
-- keymap("o", "L", "$", opts)

-- keymap("n", "n", "nzzzv", opts)
-- keymap("n", "N", "Nzzzv", opts)

-- Naviagate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- keymap("n", "<RightMouse>", ":Alpha<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
-- keymap("v", "P", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom
-- keymap("n", "<c-h>", "<cmd>nohlsearch<cr>", opts)
-- NOTE: the fact that tab and ctrl-i are the same is stupid
-- keymap("n", "<TAB>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<F1>", ":e ~/Notes/<cr>", opts)
keymap("n", "<F3>", ":e .<cr>", opts)
keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
keymap(
  "n",
  "<F6>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  opts
)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)

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
keymap("n", "<Leader>tc", ":Telescope git_commits previewer=false<CR><CR>", opts)
keymap("n", "<Leader>tb", ":Telescope git_branches previewer=false<CR>", opts)
keymap("n", "<Leader>to", ":Telescope oldfiles<CR>", opts)
keymap("n", "<Leader>tp", ":Telescope projects<CR>", opts)
keymap("n", "<Leader>tt", ":Telescope buffers<CR>", opts)
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
