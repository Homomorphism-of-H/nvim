---@type vim.lsp.Config
return {
    cmd = { "nil" },

    filetypes = { "nix" },

    on_attach = function(client)
        -- We get completion from nixd, and everything else from nil
        client.server_capabilities.completionProvider = nil
    end,
}
