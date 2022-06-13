local opt = vim.opt
local g = vim.g
local override = require "custom.override"

local M = {}

M.options = {

   user = function()
      opt.tabstop = 2
      opt.shiftwidth = 2
      opt.mouse = "c"
      opt.expandtab = false
      opt.scrolloff = 5
      g.loaded_ruby_provider = 0
      g.loaded_perl_provider = 0
   end,
}

M.plugins = {

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },

      statusline = {
         separator_style = "default",
      },
   },

   remove = {
      "folke/whick-key.nvim",
   },

   override = {
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
      ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
      ["hrsh7th/nvim-cmp"] = override.cmp,
      ["williamboman/nvim-lsp-installer"] = override.lsp_installer,
   },

   user = require "custom.plugins",
}

M.ui = {
   hl_override = require "custom.highlights",
   changed_themes = {},
   theme_toggle = { "onedark", "one_light" },
   theme = "gruvchad",
   transparency = true,
}

M.mappings = require "custom.mappings"

return M
