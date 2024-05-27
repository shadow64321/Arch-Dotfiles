return {
  { 
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup{}
      lspconfig.clangd.setup{}
      -- lspconfig.cmake.setup({})
      -- lspconfig.gopls.setup({})
      -- lspconfig.autotools_ls.setup({})
      -- lspconfig.markdown_oxide.setup({})
      -- lspconfig.taplo.setup({})
      -- lspconfig.lemminx.setup({})
      -- lspconfig.hydra_lsp.setup({})
      -- lspconfig.zls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
