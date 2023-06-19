local keymap = vim.keymap.set
local default_opts =  { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap('n', '<leader>.', ':BufferNext<CR>', default_opts)
keymap('n', '<leader>,', ':BufferPrevious<CR>', default_opts)
keymap('n', '<C-s>s', ':w<CR>', default_opts)
keymap('n', '<C-S>q',':wqall<CR>', default_opts)
keymap('n', '<leader>b', ':Neotree toggle<CR>', default_opts)
keymap('n', '<leader>q', ':BufferClose<CR>', default_opts)
keymap('n', '<leader>t', ':lua ToggleTerminal()<CR>', default_opts)
keymap('t', '<leader>t', '<C-Bslash><C-n>:lua ToggleTerminal()<CR>', default_opts)
keymap('n', '<leader>g', ':lua _gitui_toggle()<CR>', default_opts)
keymap('n', '<leader>c', ':bp<bar>sp<bar>bd<bar>bd<CR>', default_opts)

function ToggleTerminal()
	if not vim.g.my_term_win_open
	then
		OpenTerminal()
		vim.g.my_term_win_open = true
	else
		CloseTerminal()
		vim.g.my_term_win_open = false
	end
end

function OpenTerminal()
	if not vim.g.my_term_buf_num
		then
			vim.g.my_term_buf_num, vim.g.my_term_win_num = SplitTerminal()
		else
			vim.g.my_term_win_num = SwitchToTerminal(vim.g.my_term_buf_num)	
	end
end

function CloseTerminal()
	if not vim.g.my_term_win_num
		then
			print("MyTerm not open")
		else
			if vim.api.nvim_win_is_valid(vim.g.my_term_win_num)
				then
					vim.api.nvim_win_close(vim.g.my_term_win_num, false)
				else
					vim.g.my_term_buf_num = nil
			end
			vim.g.my_term_win_num = nil
	end
end


function SplitTerminal()
	local current_window = vim.api.nvim_get_current_win()
	local height = math.floor(vim.api.nvim_win_get_height(0) / 3)
	local width = vim.api.nvim_win_get_width(0)

	vim.api.nvim_command('belowright split')
	local new_win = vim.api.nvim_get_current_win()
	local new_buf = vim.api.nvim_create_buf(false, true)

	vim.api.nvim_win_set_option(new_win, 'number', false)
	vim.api.nvim_win_set_height(new_win, height)
	--vim.api.nvim_command('terminal')
	vim.api.nvim_win_set_buf(new_win, new_buf)
	local JobID = vim.fn.termopen("bash")
	vim.api.nvim_chan_send(JobID, "clear;history -d $(history 1)\n")
	vim.api.nvim_command('normal! ggG$')
	vim.api.nvim_command('startinsert')
	return new_buf, new_win
end

function SwitchToTerminal(bufnum)
	local current_window = vim.api.nvim_get_current_win()
	local height = math.floor(vim.api.nvim_win_get_height(0) / 3)
	local width = vim.api.nvim_win_get_width(0)

	vim.api.nvim_command('belowright split')
	local new_win = vim.api.nvim_get_current_win()

	vim.api.nvim_win_set_option(new_win, 'number', false)
	vim.api.nvim_win_set_height(new_win, height)
	vim.api.nvim_win_set_buf(new_win, bufnum)
	vim.api.nvim_command('normal! ggG$')
	vim.api.nvim_command('startinsert')
	return new_win
end

