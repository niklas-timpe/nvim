--require("conform").setup({
--    formatters = {
--        perltidy = {
--            args = { 
--                "-t", 
--                "-et=4", 
--                "-dt=4", 
--                "-pt=2", 
--                "-xci", 
--                "-ce", 
--                "-boc", 
--                "-wtc=m -atc", 
--                "-vxl='='", 
--                "-wrs='!'", 
--                "-iscl", 
--                "-csci=23", 
--                "-csc", 
--                "-nvsc", 
--                "--noblanks-before-comments", 
--                "--space-signature-paren=0" 
--            },
--            rootPatterns = { ".git" },
--        },
--
--
--
--    },
--    formatters_by_ft = {
--        lua = { "stylua" },
--        perl = { 
--            command = "perltidy -pro=/home/niklas/.perltidyrc",
--        },
--        ---- Conform will run multiple formatters sequentially
--        --python = { "isort", "black" },
--        ---- Use a sub-list to run only the first available formatter
--        --javascript = { { "prettierd", "prettier" } },
--    },
--})

