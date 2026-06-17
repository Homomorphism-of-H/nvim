local function crates()
    require('crates').setup(
        {
            smart_insert = true,
            autoload = true,

            text = {
                loading = "  Loading...",
                version = "  %s",
                prerelease = "  %s",
                yanked = "  %s yanked",
                nomatch = "  Not found",
                upgrade = "  %s",
                error = "  Error fetching crate",
            },

            lsp = {
                enabled = true,
                on_attach = function(client, bufnr)
                    -- the same on_attach function as for your other language servers
                    -- can be ommited if you're using the `LspAttach` autocmd
                end,
                actions = true,
                completion = true,
                hover = true,
            },
        })
end

-- Crates
vim.schedule(crates)
