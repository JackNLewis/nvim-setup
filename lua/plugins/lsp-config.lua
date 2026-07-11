return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			local servers = {
				"gopls",
				"lua_ls",
				"pyright",
				"ts_ls",
			}

			require("mason-lspconfig").setup({
				ensure_installed = servers, -- since you're using Go, based on your treesitter config
			})

			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end

			-- Keymaps: only apply in buffers where an LSP client has attached
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf, silent = true }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set(
						"n",
						"fr",
						vim.lsp.buf.references,
						{ buffer = true, desc = "List all references to the symbol under the cursor" }
					)
				end,
			})
		end,
	},
}
