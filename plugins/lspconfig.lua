local M = {}

M.setup_lsp = function(attach, capabilities)
   -- override vim.notify to fix clangd offset_encodings issue
   vim.notify = function(msg, log_level)
      if msg:match "exit code" or msg:match "warning: multiple different client offset_encodings" then
         return
      end
      if log_level == vim.log.levels.error then
         vim.api.nvim_err_writeln(msg)
      else
         vim.api.nvim_echo({ { msg } }, true, {})
      end
   end

   local lspconfig = require "lspconfig"

   local servers = { "html", "cssls", "bashls", "emmet_ls", "tsserver" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end

   lspconfig["clangd"].setup {
      cmd = {
         "clangd",
         "--header-insertion=never",
      },
      on_attach = function(client, bufnr)
         attach(client, bufnr)
         client.resolved_capabilities.document_formatting = false
      end,
      capabilities = capabilities,
   }
end

return M
