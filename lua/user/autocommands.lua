vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "Markdown",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "Jaq" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> <m-r> :close<CR>
      " nnoremap <silent> <buffer> <m-r> <NOP>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local buf_ft = vim.bo.filetype
    if buf_ft == "" or buf_ft == nil then
      vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <c-j> j<CR>
      nnoremap <silent> <buffer> <c-k> k<CR>
      set nobuflisted
    ]]
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local get_project_dir = function()
      local cwd = vim.fn.getcwd()
      local project_dir = vim.split(cwd, "/")
      local project_name = project_dir[#project_dir]
      return project_name
    end

    vim.opt.titlestring = get_project_dir() .. " - nvim"
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "term://*" },
  callback = function()
    vim.cmd "startinsert!"
    -- TODO: if java = 2
    vim.cmd "set cmdheight=1"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lir" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.ts" },
  callback = function()
    vim.lsp.buf.format { async = true }
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    local status_ok, luasnip = pcall(require, "luasnip")
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      -- luasnip.unlink_current()
      vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})

local keymap = vim.api.nvim_buf_set_keymap
local Compile = vim.api.nvim_create_augroup("Compile", { clear = true })
local optn = { noremap = true, silent = true }

local c = vim.api.nvim_create_autocmd
local cpp = vim.api.nvim_create_autocmd
local go = vim.api.nvim_create_autocmd
local js = vim.api.nvim_create_autocmd
local ts = vim.api.nvim_create_autocmd
local py = vim.api.nvim_create_autocmd
local asm = vim.api.nvim_create_autocmd
local ocaml = vim.api.nvim_create_autocmd

local lsp = vim.api.nvim_create_autocmd
local format = vim.api.nvim_create_autocmd
local code = vim.api.nvim_create_autocmd

function My_lsp_errors()
  vim.diagnostic.setloclist { open = false }
end

function My_formatting()
  vim.lsp.buf.format()
end

function My_clear()
  keymap(0, "n", "<F9>", ":echo ''<CR>", optn)
end

local Auto_formatting = vim.api.nvim_create_augroup("Formating", { clear = true })
format("BufWritePre", { callback = My_formatting, group = Auto_formatting })

local LSP_errors = vim.api.nvim_create_augroup("LSP_errors", { clear = true })
lsp("BufWrite,BufEnter,InsertLeave *", { callback = My_lsp_errors, group = LSP_errors })

code("FileType", {
  pattern = "c",
  callback = function()
    keymap(0, "n", "<F12>", ":w !bear -- make && ./%:r<CR>", optn)
  end,
  group = Compile,
})

code("FileType", {
  pattern = "cpp",
  callback = function()
    keymap(0, "n", "<F12>", ":w !bear -- make && ./%:r<CR>", optn)
  end,
  group = Compile,
})

c("FileType", {
  pattern = "c",
  callback = function()
    keymap(
      0,
      "n",
      "<F9>",
      ":w <bar> exec '!gcc '.shellescape('%').' -std=c11 -Wall -Wextra -g -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>",
      optn
    )
  end,
  group = Compile,
})

cpp("FileType", {
  pattern = "cpp",
  callback = function()
    keymap(
      0,
      "n",
      "<F9>",
      ":w <bar> exec '!g++ '.shellescape('%').' -std=c++17 -Wall -Wextra -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>",
      optn
    )
  end,
  group = Compile,
})

go("FileType", {
  pattern = "go",
  callback = function()
    keymap(0, "n", "<F9>", ":w <bar> exec '!go run ' shellescape('%')<CR>", optn)
  end,
  group = Compile,
})

js("FileType", {
  pattern = "javascript",
  callback = function()
    keymap(0, "n", "<F9>", ":w<CR>:echo ''<CR>:w !node<CR>", optn)
    keymap(0, "v", "<F9>", ":w !node<CR>", optn)
  end,
  group = Compile,
})
ts("FileType", {
  pattern = "typescript",
  callback = function()
    keymap(0, "n", "<F9>", ":w<CR>:echo ''<CR>:w !npx ts-node<CR>", optn)
    keymap(0, "v", "<F9>", ":w !npx ts-node<CR>", optn)
  end,
  group = Compile,
})

py("FileType", {
  pattern = "python",
  callback = function()
    keymap(0, "n", "<F9>", ":w<CR>:echo ''<CR>:w !python3<CR>", optn)
    keymap(0, "v", "<F9>", ":w !python3<CR>", optn)
  end,
  group = Compile,
})

ocaml("FileType", {
  pattern = "ocaml",
  callback = function()
    keymap(0, "n", "<F9>", ":w<CR>:echo ''<CR>:w !ocamlopt % -o %:r && ./%:r<CR>", optn)
    keymap(0, "v", "<F9>", ":w<CR>:echo ''<CR>:w !ocamlopt % -o %:r && ./%:r<CR>", optn)
    keymap(0, "n", "<F12>", ":w<CR>:echo ''<CR>:w !./../_build/default/bin/%:r.exe<CR>", optn)
  end,
  group = Compile,
})

asm("FileType", {
  pattern = "asm",
  callback = function()
    keymap(0, "n", "<F9>", ":w<CR>:echo ''<CR>:w !spim -file '%'<CR>", optn)
    keymap(0, "v", "<F9>", ":w<CR>:echo ''<CR>:w !spim -file '%'<CR>", optn)
  end,
  group = Compile,
})
