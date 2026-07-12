return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			require("mason").setup()

			local servers = {
				"gopls",
				"lua_ls",
				"pyright",
				"ts_ls",
			}

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})

			-- Apply cmp capabilities to every LSP server
			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})

				vim.lsp.enable(server)
			end

			-- Keymaps: only apply in buffers where an LSP client has attached
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf, silent = true }

					vim.api.nvim_create_autocmd("CursorHold", {
						buffer = event.buf,
						callback = function()
							vim.diagnostic.open_float(nil, { focusable = false })
						end,
					})

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

					vim.keymap.set("n", "fr", vim.lsp.buf.references, {
						buffer = event.buf,
						silent = true,
						desc = "List all references to the symbol under the cursor",
					})
				end,
			})
		end,
	},
}
