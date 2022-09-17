local opt = vim.opt
local g = vim.g

vim.cmd [[
    set nowrap
    set noswapfile
    set noerrorbells

    colorscheme onehalfdark
    set backspace=indent,eol,start
    map ; :
]]

g.mapleader = ' '

opt.smartindent = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.clipboard = "unnamedplus"
opt.mouse = "a"

opt.number = true

opt.smartcase = true
opt.ttimeoutlen = 5
opt.compatible = false
opt.autoread = true
opt.incsearch = true
opt.hidden = true
opt.shortmess = "A"

require('neogit').setup{}

require('lualine').setup()

require('nvim_comment').setup({
      marker_mapping = true

    , comment_empty_trim_whitespace = false 
    -- Should key mappings be created
    , create_mappings = true
    , comment_empty = false
    , line_mapping = "<leader>lc", operator_mapping = "<leader>c", comment_chunk_text_object = "ic"
})
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

require'nvim-treesitter.configs'.setup{ 
    enable = true
}

require('telescope').setup{}
