return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  configs = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
    ensure_installed = {"lua", "rust", "cpp", "c", "python", "html", "css", "javascript", "vim",
      highlight = { enable = true },
      indent = { enable = true },
      }
    })
  end
}
