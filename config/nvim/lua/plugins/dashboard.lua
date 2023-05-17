return {
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    main = 'dashboard',
    opts ={
	    theme = 'doom',
  config = {
    header = {
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],

	[[ ███╗   ███╗ █████╗ ███╗   ██╗     ██╗██╗   ██╗███████╗ █████╗ ██╗  ██╗ █████╗   ]],
        [[ ████╗ ████║██╔══██╗████╗  ██║     ██║██║   ██║██╔════╝██╔══██╗██║ ██╔╝██╔══██╗  ]],
        [[ ██╔████╔██║███████║██╔██╗ ██║     ██║██║   ██║███████╗███████║█████╔╝ ███████║  ]],
        [[ ██║╚██╔╝██║██╔══██║██║╚██╗██║██   ██║██║   ██║╚════██║██╔══██║██╔═██╗ ██╔══██║  ]],
        [[ ██║ ╚═╝ ██║██║  ██║██║ ╚████║╚█████╔╝╚██████╔╝███████║██║  ██║██║  ██╗██║  ██║  ]],
        [[ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝  ]],
                                                                           
	[[]],
	[[]],


    }, --your header
    center = {
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File',
        desc_hl = 'String',
        key = 'b',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'Telescope find_files'
      },
      {
        icon = ' ',
        desc = 'Find Dotfiles',
        key = 'f',
       --  keymap = 'SPC f d',
        action = 'lua print(3)'
      },
      {
        icon = '',
        desc = 'History File',
        key = 'f',
        keymap = 'SPC f d',
        action = 'Telescope oldfiles'
      },
    },
    footer = {}  --your footer
  }
    },
    config = true,
    dependencies = { 
      {'nvim-tree/nvim-web-devicons'}
    }
  }
}
