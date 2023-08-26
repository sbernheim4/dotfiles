local dashboard = require('dashboard')

dashboard.setup {
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{
        action = 'Lazy',
        desc = ' Update',
        group = '@property',
        icon = '⥀',
        key = 'u',
			},
			{
				action = 'Files',
				desc = 'Files',
				group = 'Label',
				icon = ' ',
				icon_hl = '@variable',
				key = 'ff',
			},
		},
	},
}
