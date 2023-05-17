-- lsp 配置

-- 插件配置
local opts = {

}

local MA = {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    main = "mason",
    opts = opts,
    config = true
}

local MC = {
  "williamboman/mason-lspconfig.nvim",
  main = "mason-lspconfig",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" },
    })
  end
}

local ML = {
  'neovim/nvim-lspconfig',
  config = function()
    require("lspconfig").lua_ls.setup {}
  end
}
return {MA, MC, ML}

