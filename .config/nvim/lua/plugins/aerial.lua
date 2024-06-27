return {
    {
        'stevearc/aerial.nvim',
        config = function()
            require('aerial').setup({
                -- optionally use on_attach to set keymaps when aerial has attached to a buffer
                on_attach = function(bufnr)
                    -- Jump forwards/backwards with '{' and '}'
                    vim.keymap.set('n', '<leader>[', '<cmd>AerialPrev<CR>', {buffer = bufnr})
                    vim.keymap.set('n', '<leader>]', '<cmd>AerialNext<CR>', {buffer = bufnr})
                end,
                layout = {
                    min_width = 30,
                },
                backends = { "treesitter", "lsp", "markdown", "man" },
                icons = nil,
                nerd_font = false,
                close_on_select = false,
            })
        end,
        keys = {
            { "<F12>", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
        }
    }
}
