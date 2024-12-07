return { -- You can easily change to a different colorschem
'folke/tokyonight.nvim',

priority = 1000, -- Make sure to load this before all the other start plugins.
init = function()
  -- Load the colorscheme here.
  vim.cmd.colorscheme 'tokyonight-night'

  -- Reference to the tokyonight options
  local tokyonight_opts = {
    transparent = true,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
    },
  }

  -- Function to toggle transparency
  local function toggle_transparency()
    -- Toggle the transparent option
    tokyonight_opts.transparent = not tokyonight_opts.transparent

    -- Reload the tokyonight theme with the updated options
    require('tokyonight').setup(tokyonight_opts)
    vim.cmd 'colorscheme tokyonight-night'

    -- Set the background color
    if tokyonight_opts.transparent then
      vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
      vim.cmd 'hi LineNr guibg=NONE ctermbg=NONE'
      vim.api.nvim_set_hl(0, "Comment", { fg = "#949b9c" })
    else
        vim.api.nvim_set_hl(0, "Comment", { fg = "#949b9c" })
    --   vim.cmd 'hi Normal guibg=#1a1b26 ctermbg=0'
    --   vim.cmd 'hi LineNr guibg=#1a1b26  ctermbg=0'
    end

    -- Notify the user
    print('Transparency ' .. (tokyonight_opts.transparent and 'enabled' or 'disabled'))
  end

  -- Keybinding to toggle transparency with <leader>bg
  vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })

  -- Configure highlights
   -- Set line number colors
  vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ffd700', bg = '#1a1b26' }) -- Gold line numbers
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ff4500', bold = true }) -- Optional: Highlight the current line number
  vim.api.nvim_set_hl(0, "Comment", { fg = "#949b9c" })
  vim.api.nvim_set_hl(0, "@variable", { fg = "#FFD700" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#FFD700" })

  end,
}

