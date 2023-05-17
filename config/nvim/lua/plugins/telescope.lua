return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim'},
    init = function()
      require('telescope').load_extension('projects')
    end,
    lazy = false,
    keys = {
	-- 查找当前文件夹的文件
	{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "find current file"},
	-- 查找全局文件夹
	-- { "<C->", "<cmd>Telescope live_grep<cr>", desc = "find global file"}
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-H>"] = 'which_key'
          }
        }
      },
      pickers = {
      },
      extensions = {
      }
    },
    main = 'telescope',
    config = true,
  }
}
