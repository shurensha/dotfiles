return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fc", builtin.commands, {})
			vim.keymap.set("n", "<C-e>", ':lua require"telescope.builtin".find_files({ hidden = true})<CR>', {})
			vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		end,
	},
}
