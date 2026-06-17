---@type vim.lsp.Config
return {
    cmd = {
        "nixd",
        "--inlay-hints=false",
        "--semantic-tokens=true",
    },

    filetypes = { "nix" },

    on_attach = function(client)
        client.server_capabilities.codeActionProvider = nil
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentSymbolProvider = false
        client.server_capabilities.documentHighlightProvider = false
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.inlayHintProvider = false
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.renameProvider = false
    end,
}
