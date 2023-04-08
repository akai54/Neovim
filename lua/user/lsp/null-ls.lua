local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        formatting.prettier.with {
            extra_filetypes = { "toml", "solidity" },
            extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        },
        formatting.ruff,

        formatting.stylua,
        formatting.shfmt,
        formatting.beautysh,
        diagnostics.shellcheck,
        diagnostics.selene,
        diagnostics.zsh,
    },
}

local unwrap = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "rust" },
    generator = {
        fn = function(params)
            local diagnostics_2 = {}
            -- sources have access to a params object
            -- containing info about the current file and editor state
            for i, line in ipairs(params.content) do
                local col, end_col = line:find "unwrap()"
                if col and end_col then
                    -- null-ls fills in undefined positions
                    -- and converts source diagnostics into the required format
                    table.insert(diagnostics_2, {
                        row = i,
                        col = col,
                        end_col = end_col,
                        source = "unwrap",
                        message = "hey " .. os.getenv "USER" .. ", don't forget to handle this",
                        severity = 2,
                    })
                end
            end
            return diagnostics_2
        end,
    },
}
null_ls.register(unwrap)
