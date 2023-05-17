
local opts = {}


local nvim_cmp = {
  "hrsh7th/nvim-cmp",
}

local cmp_nvim_lsp = {
  url = "git@github.com:hrsh7th/cmp-nvim-lsp.git"
}

local cmp_luasnip = {
  'L3MON4D3/LuaSnip',
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "<CurrentMajor>.*",
  build = "make install_jsregexp",
  config = function()
  end
}

local cmp_buffer = {
  "hrsh7th/cmp-buffer",
}

local cmp_path = {
  "hrsh7th/cmp-path",
}

local cmp_cmdline = {
  "hrsh7th/cmp-cmdline",
}

return {
   nvim_cmp,
   cmp_nvim_lsp,
   cmp_luasnip,
   cmp_buffer,
   cmp_path,
   cmp_cmdline
}
