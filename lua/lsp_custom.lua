local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)


vim.lsp.enable 'clangd'
vim.lsp.enable 'pyright'
vim.lsp.enable 'lua_ls'


-- Setup nvim-cmp
local cmp = require('cmp')

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Navigate between completion items
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),

    -- Scroll documentation
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    -- Trigger completion
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'ultisnips'},
    {name = 'buffer'},
  }
})
