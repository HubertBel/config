vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set colorcolumn=80")
vim.cmd("set scrolloff=3")
vim.g.mapleader = " "
vim.cmd("nnoremap n nzz")
vim.cmd("nnoremap N Nzz")
vim.cmd("inoremap jk <esc>")
vim.cmd("inoremap kj <esc>")
vim.wo.number = true
vim.wo.relativenumber = true
vim.cmd(":se cursorline")
