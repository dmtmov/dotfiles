--

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-c>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ['<Up>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
        ['<Down>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),

        ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
        ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),

        ['<Tab>'] = cmp.mapping(function(fallback)
              local col = vim.fn.col('.') - 1

              if cmp.visible() then
                cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
              elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
              else
                cmp.complete()
              end
            end, {'i', 's'}),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
              else
                fallback()
              end
            end, {'i', 's'}),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'snippy' },
        { name = 'treesitter' },
        { name = 'cmp_tabnine' },
        { name = 'path' },
        { name = 'buffer' },
    }),

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        --documentation = {
        --    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        --},
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = 'λ',
            luasnip = '⌲',
            buffer = '⍩',
            path = '⎇',
          }

          item.menu = menu_icon[entry.source.name]
          return item
        end,
    }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

cmp.setup {
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
    }
}


local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = '⇲'})

