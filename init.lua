

local call = vim.call
local cmd = vim.cmd
local g = vim.g
local map = vim.api.nvim_set_keymap
local o = vim.o
local opt = vim.opt
local kmap = vim.keymap.set

local function print_stdout(chan_id, data, cname)
	print(data[1])
end

o.tabstop = 2
o.softtabstop = 0
o.expandtab = true
o.shiftwidth = 2
o.smarttab = true

opt.colorcolumn = "100"
opt.completeopt = { 'menu', 'menuone', 'noselect' }


require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
		},
  },
  extensions = {
    file_browser = {
      theme = 'ivy',
      hijack_netrw = true,
      mappings = {
        ['i'] = {

        },
        ['n'] = {

        },
      },
    }
  }
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'file_browser')

-- Config
g.ale_linters = {
    python = {'black'},
}

-- Mappings

kmap('n', '<leader>sf', require('telescope.builtin').find_files, {desc = '[S]earch [F]iles'})
kmap('n', '<leader>sh', require('telescope.builtin').help_tags, {desc = '[S]earch [H]elp'})
kmap('n', '<leader>sw', require('telescope.builtin').grep_string, {desc = '[S]earch current [W]ord'})
kmap('n', '<leader>sg', require('telescope.builtin').live_grep, {desc = '[S]earch by [G]rep'})
kmap('n', '<leader>sd', require('telescope.builtin').live_grep, {desc = '[S]earch [D]iagnostics'})
kmap('n', '<leader>sb', require('telescope.builtin').buffers, {desc = '[] Find existing buffers'})

kmap('n', '<leader>f', require('telescope.builtin').buffers, {desc = '[] Find existing buffers'})


-- CMDs

cmd [[colorscheme jellybeans]]
cmd [[
  function! CycleNumbering()
    if exists('+relativenumber')
      execute {
        \ '00': 'set relativenumber  | set number',
        \ '01': 'set norelativenumber  | set number',
        \ '10': 'set norelativenumber  | set nonumber',
        \ '11': 'set norelativenumber  | set number', }[&number . &relativenumber]
    else
      set number!<CR>
    endif
  endfunction
  nmap <leader>n :call CycleNumbering()<CR>
]]

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- My plugins here
	-- use 'foo1/bar1.nvim'
	-- use 'foo2/bar2.nvim'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	use 'christoomey/vim-tmux-navigator'
	use 'flazz/vim-colorschemes'
	use 'SirVer/Ultisnips'
	use 'honza/vim-snippets'
	use 'EvanQuan/vim-executioner'

	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'

	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-file-browser.nvim'
		}
	}

	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make',
		cond = vim.fn.executable 'make' == 1
	}

  --Code Analysis
  use 'dense-analysis/ale'

  --Python
  use {
    'psf/black',
    branch = 'stable',
  }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
