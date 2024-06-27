return {
	"pappasam/nvim-repl",
	init = function()
		vim.g["repl_filetype_commands"] = {
			javascript = "node",
			python = "ipython --no-autoindent",
			lua = "lua",
		}
	end,
	keys = {
		{ "<leader>rt", "<cmd>ReplToggle<cr>", desc = "Toggle nvim-repl" },
		{ "<leader>rc", "<cmd>ReplRunCell<cr>", desc = "nvim-repl run cell" },
		{ "<leader>rv", "<Plug>ReplSendVisual", desc = "nvim-repl run visual", mode = "x" },
	},
    lazy = false,
}
