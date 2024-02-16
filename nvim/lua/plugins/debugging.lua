return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-dap-python",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		require("dapui").setup()
		require("dap-python").setup()
	end,
}
