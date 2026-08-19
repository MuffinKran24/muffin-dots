return {
  'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        "clangd",
        "lua_ls",
        "pyright",
        "html",
        "rust_analyzer",
        "vimls",
      },
    },
  dependencies = {
    {
      'williamboman/mason.nvim',
        opts = {
          ui = {
            icons = {
              package_installed = " ",
              package_pending = " ",
              package_uninstalled = " ",
            },
          },
        },
    },
    'neovim/nvim-lspconfig'
  }
}
