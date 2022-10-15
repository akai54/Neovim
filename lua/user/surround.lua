local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

surround.setup {
  keymaps = { -- vim-surround style keymaps
    [[insert = "<C-g>g",
    insert_line = "<C-g>G",
    normal = "g",
    normal_cur = "gg",
    normal_line = "g",
    normal_cur_line = "GG",
    visual = "g",
    visual_line = "gG",
    delete = "dg",
    change = "cg",]],
  },
  delimiters = {
    pairs = {
      ["("] = { "( ", " )" },
      [")"] = { "(", ")" },
      ["{"] = { "{ ", " }" },
      ["}"] = { "{", "}" },
      ["<"] = { "< ", " >" },
      [">"] = { "<", ">" },
      ["["] = { "[ ", " ]" },
      ["]"] = { "[", "]" },
      -- Define pairs based on function evaluations!
      ["i"] = function()
        return {
          require("nvim-surround.utils").get_input "Enter the left delimiter: ",
          require("nvim-surround.utils").get_input "Enter the right delimiter: ",
        }
      end,
      ["f"] = function()
        return {
          require("nvim-surround.utils").get_input "Enter the function name: " .. "(",
          ")",
        }
      end,
    },
    separators = {
      ["'"] = { "'", "'" },
      ['"'] = { '"', '"' },
      ["`"] = { "`", "`" },
    },
    HTML = {
      ["t"] = "type", -- Change just the tag type
      ["T"] = "whole", -- Change the whole tag contents
    },
    aliases = {
      ["a"] = ">", -- Single character aliases apply everywhere
      ["b"] = ")",
      ["B"] = "}",
      ["r"] = "]",
      -- Table aliases only apply for changes/deletions
      ["q"] = { '"', "'", "`" }, -- Any quote character
      ["s"] = { ")", "]", "}", ">", "'", '"', "`" }, -- Any surrounding delimiter
    },
    invalid_key_behavior = function()
      vim.notify("Invalid surround character", vim.log.levels.INFO)
    end,
  },
  highlight_motion = { -- Highlight before inserting/changing surrounds
    duration = 0,
  },
}

vim.cmd [[nmap <leader>' siw']]
