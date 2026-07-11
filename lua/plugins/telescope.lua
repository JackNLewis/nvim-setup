return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find Live Grep" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
	},
	opts = function()
		local actions = require("telescope.actions")
		return {
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal", -- or your existing choice
				layout_config = {
					prompt_position = "top", -- pairs well with ascending
				},
				mappings = {
					i = {
						["<C-l><C-l>"] = actions.send_to_qflist + actions.open_qflist,
						["<C-l><C-t>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					n = {
						["<C-l><C-l>"] = actions.send_to_qflist + actions.open_qflist,
						["<C-l><C-t>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		}
	end,
}
