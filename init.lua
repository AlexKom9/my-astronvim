return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }



    -- -- https://github.com/neovim/neovim/issues/23526#issuecomment-1539580310
    -- vim.diagnostic.config( {
    --   virtual_text = false
    -- })
    --
    -- local ns = vim.api.nvim_create_namespace('CurlineDiag')
    --
    -- vim.opt.updatetime = 100
    --
    -- vim.api.nvim_create_autocmd('LspAttach', {
    --   callback = function(args)
    --     vim.api.nvim_create_autocmd('CursorHold', {
    --       buffer = args.buf,
    --       callback = function()
    --         pcall(vim.api.nvim_buf_clear_namespace,args.buf,ns, 0, -1)
    --         local hi = { 'Error', 'Warn','Info','Hint'}
    --         local curline = vim.api.nvim_win_get_cursor(0)[1]
    --         local diagnostics = vim.diagnostic.get(args.buf, {lnum =curline - 1})
    --         local virt_texts = { { (' '):rep(4) } }
    --         for _, diag in ipairs(diagnostics) do
    --           virt_texts[#virt_texts + 1] = {diag.message, 'Diagnostic'..hi[diag.severity]}
    --         end
    --         vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0,{
    --           virt_text = virt_texts,
    --           hl_mode = 'combine'
    --         })
    --       end
    --     })
    --   end
    -- })

    vim.opt.spell = true
    vim.opt.spelllang = 'en_us'
    vim.opt.spelloptions = 'camel'
  end
}
