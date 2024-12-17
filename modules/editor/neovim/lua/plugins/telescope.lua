local M = {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {

    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "find files",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "live grep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "find buffers",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "help _tags",
    },
  }
}

return {M}
