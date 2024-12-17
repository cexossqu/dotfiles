-- 插件管理的工具方法

local M = {}

function M.addPlugins(suffix,plugins)
  local res = {}
  for _,v in pairs(plugins) do
    local temp = require(suffix .. v)
    table.insert(res, temp)
  end
  return res
end

function M.addModules(suffix, modules)
  local res = {}
  for _, v in pairs(modules) do
    local temp = require(suffix .. v) 
    for _, m in pairs(temp) do
      table.insert(res, m) 
    end
  end
  return res
end


return M
