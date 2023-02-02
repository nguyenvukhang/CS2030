local plugins = require('plugins').plugins

require 'paq'(plugins)

local cmp = require 'cmp'
local types = require 'cmp.types'
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-l>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      -- remove `Snippet` entries
      entry_filter = function(entry)
        return types.lsp.CompletionItemKind[entry:get_kind()] ~= 'Snippet'
      end,
    },
  }),
})
