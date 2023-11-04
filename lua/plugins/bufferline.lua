return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        numbers = function(opts)
          return string.format("%s", opts.ordinal)
        end,
        close_command = "bdelete! %d",
        right_mouse_command = nil,
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 10,
        diagnostics = false,
        custom_filter = function(bufnr)
          -- if the result is false, this buffer will be shown, otherwise, this
          -- buffer will be hidden.

          -- filter out filetypes you don't want to see
          local exclude_ft = { "qf", "fugitive", "git" }
          local cur_ft = vim.bo[bufnr].filetype
          local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

          if should_filter then
            return false
          end

          return true
        end,
        show_buffer_icons = false,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "bar",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "id",
        offsets = {
          {
            filetype = "NvimTree",
            text = function()
              return vim.fn.getcwd()
            end,
            highlight = "Directory",
            text_align = "center",
            separator = true,
          },
        },
      },
    })
    local keymap = vim.api.nvim_set_keymap
    -- buffer controll

    keymap("n", "<leader>n", "<cmd>BufferLineCycleNext<CR>", { silent = true })
    keymap("n", "<leader>p", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
    keymap("n", "<leader>q", "<cmd>bdelete<CR>", { silent = true })

    keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { silent = true })
    keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { silent = true })
    keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { silent = true })
    keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", { silent = true })
    keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", { silent = true })
    keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", { silent = true })
    keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", { silent = true })
    keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 9<CR>", { silent = true })
  end,
}
