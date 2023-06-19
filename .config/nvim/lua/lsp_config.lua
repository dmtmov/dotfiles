--
-- require("mason").setup()
--require("mason-lspconfig").setup()

local SERVERS = {
    'pyright',
    'lua_ls',
    'tsserver',
    'sourcekit',
    'html',
    'jsonls',
    'cssls',
    'taplo',
    'yamlls'
}


local onAttachMappings = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', '<leader>1', '<cmd>vsplit | lua vim.lsp.buf.declaration() <CR>', opts)
    buf_set_keymap('n', '<leader>2', '<cmd>vsplit | lua vim.lsp.buf.definition() <CR>', opts)
    buf_set_keymap('n', '<leader>3', '<cmd>vsplit | lua vim.lsp.buf.type_definition() <CR>', opts)
    buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover() vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gref', '<cmd>lua vim.lsp.buf.references() vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gof', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    --buf_set_keymap('n', 'g8', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    --buf_set_keymap('n', 'g4', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', 'g5', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('i', '<c-v>', '<c-x><c-v>', opts)
    -- buf_set_keymap('i', '<c-l>', '<c-x><c-l>', opts)
    --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    --[[
    require "lsp_signature".on_attach({
        signature_setup = {
            bind = true,
            handler_opts = { border = "rounded" }
        },
        bufnr
    })
    --]]
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- Enable completion in LSP
local lspconfig = require('lspconfig')
for _, lsp in ipairs(SERVERS) do
    lspconfig[lsp].setup {
        on_attach = onAttachMappings,
        capabilities = capabilities,
    }
end


vim.lsp.handlers['textDocument/diagnostic'] = vim.lsp.with(
    vim.lsp.handlers.diagnostic,
    { border = 'rounded' }
)

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
)


local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({ name = 'DiagnosticSignError', text = '✘' })
sign({ name = 'DiagnosticSignWarn', text = '▲' })
sign({ name = 'DiagnosticSignHint', text = '⚑' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

