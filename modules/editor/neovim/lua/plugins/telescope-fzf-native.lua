function on_load(name, fn)
  local Config = require("lazy.core.config")
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end


local M = {
  "nvim-telescope/telescope-fzf-native.nvim",
  build = "make",
  enabled = vim.fn.executable("make") == 1,
  config = function()
    on_load("telescope.nvim", function()
      require("telescope").load_extension("fzf")
    end)
  end,
}

return { M }
