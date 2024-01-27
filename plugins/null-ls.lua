return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local helpers = require "null-ls.helpers"

    -- Custom diagnostic generator for cspell
    local cspell_config_path = vim.fn.expand("~/.config/nvim/lua/user/cspell.json") -- Path to your cspell config

    local cspell = null_ls.builtins.code_actions.cspell.with({
        config = {
            find_json = function(cwd)
                return vim.fn.expand("~/.config/nvim/lua/user/cspell.json")
                -- return vim.fn.expand(cwd .. "/cspell.json")
            end
        },
    })

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
    -- Set a formatter
    -- null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.eslint,
      -- null_ls.builtins.formatting.cspell.with({
      --   config = cspell_config_path,
      -- }),
      cspell,
      -- null_ls.builtins.diagnostics.typos,
    }

    return config -- return final config table
  end,
}
