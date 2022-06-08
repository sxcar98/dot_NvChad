-- overriding default plugin configs!

local M = {}

M.treesitter = {
   ensure_installed = {
      "c",
      "cpp",
      "lua",
      "markdown",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },

   renderer = {
      highlight_git = true,
      icons = {
         show = {
            git = true,
         },
      },
   },
}

M.blankline = {
   filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "nvchad_cheatsheet",
      "lsp-installer",
      "norg",
      "",
   },
}

M.cmp = {
   formatting = {
      format = function(entry, vim_item)
         local icons = require "plugins.configs.lspkind_icons"
         vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

         vim_item.menu = ({
            buffer = "[BUF]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            path = "[Path]",
            luasnip = "[Snippet]",
            cmp_tabnine = "[TabNine]",
            look = "[Look]",
            spell = "[Spell]",
            calc = "[Calc]",
            emoji = "[Emoji]",
         })[entry.source.name]

         return vim_item
      end,
   },
   sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
   },
}

M.lsp_installer = {
   automatic_installation = false,
}

return M
