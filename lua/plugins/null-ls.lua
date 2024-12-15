return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Custom configuration for Spotless
                null_ls.builtins.formatting.generic_formatter.with({
                    command = "java",
                    args = {
                        "-jar",
                        vim.fn.expand("~/Downloads/spotless-eclipse-jdt-4.8.1-javadoc.jar"), -- Path to the spotless jar
                        "-config",
                        vim.fn.expand("~/.config/nvim/config/eclipse-java-formatter.xml"),  -- Path to the XML config
                    },
                    to_stdin = true,
                    filetypes = { "java" }, -- Formatter applies only to Java files
                }),
            },
        })
    end,
}

