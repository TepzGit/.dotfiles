require("Tepz.remap")
require("Tepz.lazy")
require("Tepz.plugins.treesitter")
require("Tepz.plugins.lsp")
require("Tepz.plugins.telescope")
require("Tepz.plugins.autopair")
require("Tepz.plugins.surround")

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

vim.cmd('set guicursor=i:ver25-iCursor')
vim.cmd('set nofixendofline')

-- Transparent command
local Transparent = true
local theme = "gruvbox"

vim.cmd("colorscheme " .. theme)
function ToggleBackground()
    if Transparent == true then
        vim.cmd('highlight Normal guibg=none')
        Transparent = false
    else
        vim.cmd('colorscheme ' .. theme)
        Transparent = true
    end
end

vim.cmd('autocmd VimEnter * lua ToggleBackground()')
vim.cmd("command! Tp lua ToggleBackground()")

