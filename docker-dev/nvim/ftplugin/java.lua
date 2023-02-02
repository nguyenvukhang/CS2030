-- To install, head over to https://download.eclipse.org/jdtls/snapshots
-- and download the latest version.
-- Unpack it at `jdtls_opts.dir` and make sure the exact filenames below match.
local jdtls_status, jdtls = pcall(require, 'jdtls')
local setup_status, setup = pcall(require, 'jdtls.setup')

local function nmap(bufnr, lhs, fn)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, '', {
    noremap = true,
    silent = true,
    callback = fn,
  })
end

if not (jdtls_status and setup_status) then
  vim.notify '[jdtls] java lsp not installed.'
  return
end

local jdtls_dir = vim.env.HOME .. '/.local/jdtls'

jdtls.start_or_attach({
  on_attach = function(_, bufnr) nmap(bufnr, 'gd', vim.lsp.buf.definition)
    nmap(bufnr, 'gD', vim.lsp.buf.declaration)
    nmap(bufnr, 'gt', vim.lsp.buf.type_definition)
    nmap(bufnr, 'gr', vim.lsp.buf.references)
    nmap(bufnr, 'gi', vim.lsp.buf.implementation)
    nmap(bufnr, 'K', vim.lsp.buf.hover)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    jdtls_dir
      .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration',
    jdtls_dir .. '/config_linux',
    '-data',
    vim.fn.stdpath 'cache'
      .. '/jdtls/'
      .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'),
  },
  root_dir = setup.find_root({ '.git' }),
  settings = { java = {} },
  init_options = { bundles = {} },
})
