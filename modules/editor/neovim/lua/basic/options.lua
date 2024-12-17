local opt = vim.opt

-- 设置相对行号
opt.relativenumber = true

-- 设置行号
opt.number = true

-- 设置缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
-- 忽略大小写
opt.ignorecase = true
opt.smartcase = true

-- 外观
-- 启用终端真颜色
opt.termguicolors = true
opt.signcolumn = "yes"

