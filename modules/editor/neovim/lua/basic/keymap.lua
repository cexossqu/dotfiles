
-- 按键映射

-- 设置leader键 将空格设置为leader键
vim.g.mapleader = " "

local keymap = vim.keymap

-- keymap.set($1, $2, $3) 方法
-- $1 代表模式 i-insert n-normal v-visual
-- $2 代表按键
-- $3 代表操作

-- ------------   插入模式(insert) ------- --


-- ------------  视觉/选择模式(visual)----- --
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- ------------  正常模式(normal)----- --
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")
