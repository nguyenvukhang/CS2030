local M = {}

M.plugins = {
  'hrsh7th/nvim-cmp',
  'neovim/nvim-lspconfig',
  'mfussenegger/nvim-jdtls',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'sbdchd/neoformat',
}

local function clone_paq()
  local path = vim.fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system({
      'git',
      'clone',
      '--depth=1',
      'https://github.com/savq/paq-nvim.git',
      path,
    })
  end
end

M.bootstrap_paq = function()
  clone_paq()
  vim.cmd 'packadd paq-nvim'
  local paq = require 'paq'
  vim.cmd 'autocmd User PaqDoneInstall quit'
  paq(M.plugins)
  paq.install()
end

return M
