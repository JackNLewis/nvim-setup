return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {"go", "c", "lua", "vim", "vimdoc" },
			highlight = { enable = true },
			indent = { enable = true },  
		})
	end
}
