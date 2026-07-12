return {
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("onedark").setup({
			style = "cool",
		})
		require("onedark").load()
	end,
}

--return {
-- "EdenEast/nightfox.nvim",
-- config = function()
-- vim.cmd("colorscheme nightfox")
-- end,
-- }

-- return {
-- "rose-pine/neovim",
-- name="moon",
-- config = function()
-- vim.cmd("colorscheme rose-pine-moon")
-- end
-- }
