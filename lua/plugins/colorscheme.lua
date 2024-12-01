return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',

  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'tokyonight-moon'

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
      vim.cmd 'colorscheme tokyonight-moon'

      -- Notify the user
      print('Transparency ' .. (tokyonight_opts.transparent and 'enabled' or 'disabled'))
    end

    -- Keybinding to toggle transparency with <leader>bg
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
