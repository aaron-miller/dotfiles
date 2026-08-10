return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = false,
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        -- Wrap markdown prose to 80 chars when formatting.
        -- prepend_args only applies to markdown via formatters_by_ft below.
        prettier_markdown_wrap = {
          command = "prettier",
          args = {
            "--stdin-filepath",
            "$FILENAME",
            "--prose-wrap",
            "always",
            "--print-width",
            "80",
          },
        },
      },
      formatters_by_ft = {
        markdown = { "prettier_markdown_wrap" },
        ["markdown.mdx"] = { "prettier_markdown_wrap" },
      },
    },
  },
}
