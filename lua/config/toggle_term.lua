require("toggleterm").setup{
	hide_numbers = true,
	shade_terminals = true,
	insert_mappings =false,
	auto_scroll = true,
	close_on_exit = true,
}

local Terminal  = require('toggleterm.terminal').Terminal
local gitui = Terminal:new({ 
	cmd = "gitui", 
	hidden = true,
	direction = "float",
	float_opts = {border  = "double"},
})

function _gitui_toggle()
  gitui:toggle()
end
