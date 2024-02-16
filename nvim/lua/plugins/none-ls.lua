return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.ruff_format,
				null_ls.builtins.diagnostics.ruff,
			},
		})
	end,
}
