vim.lsp.set_log_level("debug")

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name ~= "tsserver"
        end,
        bufnr = bufnr,
    })
end

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    client.server_capabilities.documentFormattingProvider = true

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-f>', lsp_formatting, bufopts)
end

require 'lspconfig'.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

require 'lspconfig'.cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

require 'lspconfig'.eslint.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'fe', ':EslintFixAll<CR>', bufopts)
    end
})

require 'lspconfig'.stylelint_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        'css',
        'less',
        'scss',
    },
    settings = {
        stylelintplus = {
            autoFixOnFormat = true
        }
    }
}

require 'lspconfig'.gopls.setup({
    cmd = { 'gopls' },
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
            },
            experimentalPostfixCompletions = true,
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = true,
        },
    },
    on_attach = on_attach
})

require 'lspconfig'.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

require 'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

require 'lspconfig'.solidity_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

require 'lspconfig'.glslls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { 'glslls', '--stdin', '--target-env', 'opengl' },
}

require 'lspconfig'.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
