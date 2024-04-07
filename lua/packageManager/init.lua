
-- Auto-install lazy pm if not exists
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)



-- Initialize plugins & Setup lazy
require('lazy').setup({{ import = 'packageManager.plugins' }}, {
	defaults = {
		lazy = true,
		version = '*',
	},
	lockfile = vim.fn.stdpath('config') .. '/lua/packageManager/lazy-lock.json',
	install = {
		missing = true,
		colorscheme = { 'onedark' },
	},
	ui = {
		size = { width = 0.8, height = 0.9 },
		wrap = true,
		border = 'rounded',
		-- none  single  double  rounded  solid  shadow
		title = nil,
		title_pos = 'center',
		-- center  left  right
		-- Show pills on top of the Lazy window
		pills = true,
		icons = {
			cmd         = ' ',
			config      = '',
			event       = '',
			ft          = '󰈔 ',
			init        = ' ',
			import      = ' ',
			keys        = ' ',
			lazy        = '󰒲 ',
			loaded      = '●',
			not_loaded  = '○',
			plugin      = ' ',
			runtime     = ' ',
			require     = '󰢱 ',
			source      = ' ',
			start       = '',
			task        = '✔ ',
			list = {
				'●',
				'➜',
				'★',
				'‒',
			},
		},
		throttle = 500,
	},
	checker = {
		enabled = false,
		notify = false,
		frequency = 3600,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
	profiling = {
		loader = false,
		require = false,
	},
})

