local M = {}

M.setup = function()
	local mode = vim.fn.system({'powershell.exe', '-c', 'dark-notify'})
	if (mode - 1 == 0) then
    	require("nvchad").reload_theme("one_light")
	else
    	require("nvchad").reload_theme("gruvchad")
	end
end

return M
