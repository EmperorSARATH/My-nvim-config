-- File Explorer / Tree
return {
  -- https://github.com/nvim-tree/nvim-tree.lua
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons', -- Fancy icon support
  },
  opts = {
    actions = {
      open_file = {
        window_picker = {
          enable = false
        },
      }
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },

    -- 👇 Add this block for key mappings inside the tree buffer
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      -- Default Enter key
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))

      -- New: <Space><Space> to open
      vim.keymap.set("n", "<leader><leader>", api.node.open.edit, opts("Open with Leader Leader"))
    end,
  },
  config = function(_, opts)
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup(opts)
  end
}

