vim.g.mapleader = " "

vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("n", "<leader>q", vim.cmd.Ex)
vim.keymap.set('n', '<leader>x', ':!%:p<CR>')
vim.keymap.set("v", "<S-Tab>", "<gv")

vim.keymap.set("i", "<M-BS>", "<C-o>:normal! db<CR>", { noremap = true, silent = true })

vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("i", "<C-K>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<C-J>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("n", "<C-K>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<C-J>", ":m .+1<CR>==", { noremap = true, silent = true })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.api.nvim_set_keymap('v', '"', ':let @" = "\"\" . @"<CR>gv"', {noremap = true, silent = true})

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("v", "(", "<esc>`>a)<esc>`<i(<esc>gv", { remap = false})
vim.keymap.set("v", "{", "<esc>`>a}<esc>`<i{<esc>gv", { remap = false})
vim.keymap.set("v", "[", "<esc>`>a]<esc>`<i[<esc>gv", { remap = false})

vim.keymap.set({"n", "i", "v"}, "<S-Up>", "<C-b>zz", { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v"}, "<S-Down>", "<C-f>zz", { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v"}, "<C-b>", "<C-b>zz", { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v"}, "<C-f>", "<C-f>zz", { noremap = true, silent = true })

vim.keymap.set("n", "<Tab>", ":tabn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":tabp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", ":tabe<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", ":tabe<CR>", { noremap = true, silent = true })
