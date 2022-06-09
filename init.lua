require "custom.autocmds"

require("custom.autodark").setup()
vim.cmd "silent! command! EnableShade lua require('shade').toggle()"

