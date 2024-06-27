local id = vim.api.nvim_create_augroup("FormatAutogroup", {
	clear = false,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = id,
	pattern = { "*" },
	callback = function()
		if vim.bo.filetype ~= "oil" then
			vim.cmd("FormatWrite")
		end
	end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function(args)
		if vim.fn.getqflist({ title = 0 }).title == "Diagnostics" then
			vim.diagnostic.setqflist({
				open = false,
			})
		end
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "@neorg.markup.italic.norg", { italic = true })
		vim.api.nvim_set_hl(0, "@neorg.markup.bold.norg", { bold = true })
		vim.api.nvim_set_hl(0, "@markup.strong", { bold = true })
		vim.api.nvim_set_hl(0, "@markup.strikethrough", { strikethrough = true })
		vim.api.nvim_set_hl(0, "@markup.italic", { italic = true })
	end,
})
