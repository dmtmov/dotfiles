local cmp = require'cmp'


cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-c>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Right'] = cmp.mapping.confirm({ select = true }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Tab>'] = cmp.mapping(
            function(fallback)
                local col = vim.fn.col('.') - 1
                if cmp.visible() then
                    cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    fallback()
                else
                    cmp.complete()
                end
            end,
            {'i', 's'}
        ),
        ['<S-Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
                else
                    fallback()
                end
            end,
            {'i', 's'}
        ),
    }),
    snippet = {
        expand = function()
            -- require('luasnip').lsp_expand(args.body)
            -- require('snippy').expand_snippet(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1},
        { name = 'nvim_lua', priority = 2},
        { name = 'buffer', priority = 3},
        { name = 'path', priority = 4},
        -- { name = 'cmp-nvim-lsp-signature-help', priority = 5},
        -- { name = 'luasnip' },
        -- { name = 'snippy' },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },


  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        nvim_lua = '[Lua]',
        buffer = '[Buffer]',
		path = '[Path]',
      })[entry.source.name]

      vim_item.dup = ({
        vsnip = 0,
        nvim_lsp = 0,
        nvim_lua = 0,
        buffer = 0,
      })[entry.source.name] or 0

      return vim_item
    end
  },



  })


cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
    })
})

