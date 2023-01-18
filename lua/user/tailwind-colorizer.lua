local status_ok, tailwind = pcall(require, "tailwindcss-colorizer-cmp")
if not status_ok then
  return
end

require("cmp").config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter,
}

tailwind.setup {
  color_square_width = 2,
}
