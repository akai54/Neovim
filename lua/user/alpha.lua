local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

local icons = require "user.icons"

dashboard.section.header.val = {
  "                &B5J?!~~~^^777J5B&                ",
  "            &P?^.        :?J     .^?P&            ",
  "          P7.          ^JPP:         .7P          ",
  "        5^           :JPPP7             ^5        ",
  "      B~            !PPPP5.               ~B      ",
  "     Y            .JPPPPP7                  Y     ",
  "    J            .YPPPPPPYJ7!^:.             J    ",
  "   P            .YPPPPPPPPPPPPP5J7^.          P   ",
  "  &:            ?PPPPPPPPPPPPPPPPPPPJ!:       :&  ",
  "  P.~~:.       ~PPPPPPPPPPPPPPPPPPPPPPPY!.     P  ",
  "  J :?PPYJ?!~^:5PPPPPPPPPPPPPPPPPPPPPPPPPP7:   J  ",
  "  J   :7PPPPPPPPPPPPPPPPPPPPPPPPPP5:^~!?JYPP?: J  ",
  "  P     .!YPPPPPPPPPPPPPPPPPPPPPPP~       .:~~.P  ",
  "  &:       :!JPPPPPPPPPPPPPPPPPPP?            :&  ",
  "   P          .^7J5PPPPPPPPPPPPPY.            P   ",
  "    J             .:^!7JYPPPPPPY.            J    ",
  "     Y                  7PPPPPJ.            Y     ",
  "      B~               .5PPPP!            ~B      ",
  "        5^             7PPPJ:           ^5        ",
  "          P7.         :PPJ^          .7P          ",
  "            &P?^.     J?:        .^?P&            ",
  "                &B5J?77^^~~~!?J5B&                ",
}
dashboard.section.buttons.val = {
  button("r", icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>"),
  button("t", icons.ui.List .. "  Find text", ":Telescope live_grep <CR>"),
  button("c", icons.ui.Gear .. "  Config", ":e ~/.config/nvim/init.lua <CR>"),
  button("u", icons.ui.CloudDownload .. "  Update", ":PackerSync<CR>"),
  button("q", icons.ui.SignOut .. "  Quit", ":qa<CR>"),
}
local function footer()
  -- NOTE: requires the fortune-mod package to work
  -- local handle = io.popen("fortune")
  -- local fortune = handle:read("*a")
  -- handle:close()
  -- return fortune
  return "beshoux"
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Macro"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
