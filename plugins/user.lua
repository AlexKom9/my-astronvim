return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
    },
    -- {
    --   'luozhiya/lsp-virtual-improved.nvim',
    --   event = { 'LspAttach' },
    --   config = function()
    --     require('lsp-virtual-improved').setup({
    --         virtual_improved = {
    --           severity = nil, -- Same usage as virtual_text.severity
    --           spacing = 4, -- Same usage as virtual_text.spacing
    --           prefix = '●', -- Same usage as virtual_text.prefix
    --           suffix = '', -- Same usage as virtual_text.suffix
    --           current_line = 'only', -- Current Line: 'only', 'hide', 'default'
    --           code = nil, -- Show diagnostic code.
    --         },
    --     })
    --   end,
    -- }
}


