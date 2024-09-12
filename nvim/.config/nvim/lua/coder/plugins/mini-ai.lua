return {
  "echasnovski/mini.ai",
  enabled = false,
  lazy = false,
  opts = {
    {
      custom_textobjects = nil,

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        around = "a",
        inside = "i",
        around_next = "an",
        inside_next = "in",
        around_last = "al",
        inside_last = "il",
        goto_left = "g[",
        goto_right = "g]",
      },

      -- Number of lines within which textobject is searched
      n_lines = 50,

      -- How to search for object (first inside current line, then inside
      -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
      -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
      search_method = "cover_or_next",

      -- Whether to disable showing non-error feedback
      silent = false,
    },
  },
}
