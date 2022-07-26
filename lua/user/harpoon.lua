local h_status_ok, harpoon = pcall(require, "harpoon")
if not h_status_ok then
  return
end

local keymap = vim.api.nvim_set_keymap

local h_ui = require "harpoon.ui"
local h_mark = require "harpoon.mark"

keymap("n", "<Leader>ha", "", { -- Mark file
  callback = function()
    h_mark.add_file()
  end,
})
keymap("n", "<Leader>hm", "", { -- Shows the menu
  callback = function()
    h_ui.toggle_quick_menu()
  end,
})
keymap("n", "<Tab>", "", { -- Navigates to the next Mark
  callback = function()
    h_ui.nav_next()
  end,
})
keymap("n", "<S-Tab>", "", { -- Navigates to the previous Mark
  callback = function()
    h_ui.nav_prev()
  end,
})

harpoon.setup {
  global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,
  },
}
