return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.DEBUG,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				typescriptreact = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.typescriptreact").prettierd,
				},

				typescript = {
					require("formatter.filetypes.typescript").prettierd,
				},

				javascript = {
					require("formatter.filetypes.javascript").prettierd,
				},

				css = {
					require("formatter.filetypes.css").prettierd,
				},

				markdown = {
					require("formatter.filetypes.markdown").prettierd,
				},

				go = {
					require("formatter.filetypes.go").gofmt,
				},

				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},

				lua = {
					require("formatter.filetypes.lua").stylua,
				},

				python = {
					require("formatter.filetypes.python").yapf,
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {},
			},
		})
	end,
}
