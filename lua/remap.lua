local kmap = vim.keymap.set

kmap('n', '<leader>sf', require('telescope.builtin').find_files,
     {desc = '[S]earch [F]iles'})

kmap('n', '<leader>sh', require('telescope.builtin').help_tags,
     {desc = '[S]earch [H]elp'})

kmap('n', '<leader>sw', require('telescope.builtin').grep_string,
     {desc = '[S]earch current [W]ord'})

kmap('n', '<leader>sg', require('telescope.builtin').live_grep,
     {desc = '[S]earch by [G]rep'})

kmap('n', '<leader>sd', require('telescope.builtin').live_grep,
     {desc = '[S]earch [D]iagnostics'})

kmap('n', '<leader>sb', require('telescope.builtin').buffers,
     {desc = '[] Find existing buffers'})

kmap('n', '<leader>f', ':ALEFix<CR>:w<CR>',
     {noremap = true, silent = true, nowait = true})
