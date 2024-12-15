
-- Display LSP-based breadcrumbs
return {
  -- https://github.com/utilyre/barbecue.nvim
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    -- https://github.com/SmiteshP/nvim-navic
    "SmiteshP/nvim-navic",
    -- https://github.com/nvim-tree/nvim-web-devicons
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  config = function()
    -- Setup `nvim-navic` to provide breadcrumb navigation
    require('nvim-navic').setup({
      lsp = {
        -- Enable for supported language servers
        enable = true,
        preferred_servers = {'lua_ls', 'pyright', 'tsserver','jdtls'}, -- Add your servers here
      },
    })

    -- Setup `barbecue.nvim`
    require('barbecue').setup({
      -- Optional configuration for barbecue breadcrumbs
      create_autocmd = false, -- Automatically create autocmd for changing breadcrumbs
      theme = "auto",         -- You can choose themes for the breadcrumbs
    })
    
 
  end,
}

