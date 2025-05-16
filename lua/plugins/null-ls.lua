-- return {
--     "jose-elias-alvarez/null-ls.nvim",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     config = function()
--         local null_ls = require("null-ls")
--         null_ls.setup({
--             sources = {
--                 -- Custom configuration for Spotless
--                 null_ls.builtins.formatting.generic_formatter.with({
--                     command = "java",
--                     args = {
--                         "-jar",
--                         vim.fn.expand("~/Downloads/spotless-eclipse-jdt-4.8.1-javadoc.jar"), -- Path to the spotless jar
--                         "-config",
--                         vim.fn.expand("~/.config/nvim/config/eclipse-java-formatter.xml"),  -- Path to the XML config
--                     },
--                     to_stdin = true,
--                     filetypes = { "java" }, -- Formatter applies only to Java files
--                 }),
--             },
--         })
--     end,
-- }
return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local helpers = require("null-ls.helpers")

    local spotless = {
      name = "spotless",
      method = null_ls.methods.FORMATTING,
      filetypes = { "java" },
      generator = helpers.formatter_factory({
        command = "java",
        args = {
          "-jar",
          vim.fn.expand("~/Downloads/spotless-eclipse-jdt-4.8.1-javadoc.jar"),
          "-config",
          vim.fn.expand("~/.config/nvim/config/eclipse-java-formatter.xml"),
        },
        to_stdin = true,
      }),
    }

    null_ls.setup({
      sources = {
        spotless,
      },
    })
  end,
}


