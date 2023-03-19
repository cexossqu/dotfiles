
local handle = io.popen("hyprctl workspaces -j")

local workspace = handle:read("*a")
handle:close()

print(type(workspace))

-- for i=
