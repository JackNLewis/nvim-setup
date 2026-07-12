vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Copy/Paste
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste From Clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy To Clipboard" })
vim.keymap.set("n", "<leader>yy", '"+y', { desc = "Copy Line To Clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy To Clipboard" })

-- Quickfix
local function quickfix_open()
	return vim.fn.getqflist({ winid = 0 }).winid ~= 0
end

vim.keymap.set("n", "<C-n>", function()
	if quickfix_open() then
		pcall(vim.cmd.cnext)
	end
end)

vim.keymap.set("n", "<C-p>", function()
	if quickfix_open() then
		pcall(vim.cmd.cprev)
	end
end)

vim.keymap.set("n", "<ctrl-l>", "<ctrl>q", { desc = "Add to quickfix list" })
vim.keymap.set("n", "<space>q", function()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			qf_exists = true
		end
	end
	if qf_exists then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end, { desc = "Toggle Quickfix list" })

-- Save
vim.keymap.set("n", "ss", "<leader>:w<cr>", { desc = "Save file" })
vim.keymap.set("n", "sq", "<leader>:wq<cr>", { desc = "Save file" })
vim.keymap.set("n", "qq", "<leader>:q<cr>", { desc = "Save file" })

local rln = false
vim.keymap.set("n", "<leader>l", function()
	rln = not rln
	vim.opt.relativenumber = rln
end, { desc = "Toggle relative line numbers" })
