return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      "moll/vim-bbye"
    },
    main = "bufferline",
    opts = {
      options = {
        -- 关闭tab命令, 这里使用moll/vim-bbye的 :Bdelete命令
	close_command = "Bdelete! %d",
	right_mouse_command = "Bdelete! %d",
	-- 侧边栏配置
	-- 左侧让出 neotree的位置,显示文字File Exploer
	offsets = {
	  {
	    filetype = "neo-tree",
	    text = "File Explorer",
	    highlight = "Directory",
	    text_align = "left"
	  }
	},
	diagnostics = "nvim_lsp"
      },
    },
    config = function(lazy, opts)
      vim.opt.termguicolors = true
      require("bufferline").setup(opts)
    end
  }
}
