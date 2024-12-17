
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
  "ahmedkhalf/project.nvim",
  opts = {
    manual_mode = true,
  },
  event = "VeryLazy",
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension("projects")
  end,
  keys = {
    { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
  },
}


return { M }
