{ config, options, lib, pkgs, modulesPath, ... }: 


{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      tokyonight-nvim
      neo-tree-nvim
      plenary-nvim
      nvim-web-devicons
      nui-nvim
      bufferline-nvim
      flash-nvim
      gitsigns-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      alpha-nvim
      dressing-nvim
      indent-blankline-nvim
      lualine-nvim
      mini-nvim
      noice-nvim
      nvim-notify
      nui-nvim
      which-key-nvim
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      toggleterm-nvim
      project-nvim
    ];
    # extraLuaConfig = lib.fileContents ./init.lua;
    extraLuaConfig = ''
-- neovim 基础配置
require("basic.options")

-- 按键映射
require("basic.keymap")
-- lazynvim 配置
require("lazy").setup("plugins", 
{
  performance = {
    reset_packpath = false,
    rtp = {
      reset = false,
    }
  },
  dev = {
    path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
    patterns = {
      "folke", 
      "nvim-lua",
      "nvim-tree", 
      "MunifTanjim",
      "nvim-neo-tree",
      "akinsho",
      "lewis6991",
      "nvim-telescope",
      "goolord",
      "stevearc",
      "lukas-reineke",
      "nvim-lualine",
      "echasnovski",
      "rcarriga",
      "nvim-treesitter",
      "ahmedkhalf"
    }, -- String[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
  },
  install = {
    -- Safeguard in case we forget to install a plugin with Nix
    missing = false,
    colorscheme = { "tokyonight" },
   },
})
    '';
  };
  xdg.configFile."nvim/lua" = {
    source = ./neovim/lua;
    recursive = true;
  };

}
