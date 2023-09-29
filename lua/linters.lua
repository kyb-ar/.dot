local g = vim.g

g.ale_linters = {python = {'black'}}

g.ale_fixers = {
    python = {'black'},
    cpp = {'clang-format'},
    lua = {'lua-format'}
}
