local M = {}

M.setup = function ()

  local auto_dark_mode = require('auto-dark-mode')

  auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
      require("nvchad").reload_theme("gruvchad")
	end,
	set_light_mode = function()
      require("nvchad").reload_theme("one_light")
	end,
  })
  auto_dark_mode.init()
end

return M
