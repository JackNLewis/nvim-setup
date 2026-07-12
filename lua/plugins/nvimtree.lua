return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<CR>",
			desc = "Toggle File Explorer",
		},
	},
	opts = {
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
	},
}
