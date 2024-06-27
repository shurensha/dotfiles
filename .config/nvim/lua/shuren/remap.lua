vim.keymap.set("n", "<leader>ff", "<cmd>Oil<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")
vim.keymap.set("c", "dop", "DiffviewOpen")
vim.keymap.set("c", "dcl", "DiffviewClose")
vim.keymap.set("i", "<C-J>", 'copilot#Accept("")', { expr = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("c", "Man", "vert Man")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<F3>", "<cmd>Format<CR>")

vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ih", function()
	require("lsp-inlayhints").toggle()
end)

vim.keymap.set("n", "<leader>tt", '"=strftime("%H:%M")<CR>P')
vim.keymap.set("n", "<leader>td", "<cmd>ObsidianToday<CR>")
vim.keymap.set("n", "<leader>tj", "<cmd>ObsidianTomorrow<CR>")
vim.keymap.set("n", "<leader>tk", "<cmd>ObsidianYesterday<CR>")
