return {

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
    },
    config = function()
      require("nvim-tree").setup {
        respect_buf_cwd = true,
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true
        },
        auto_reload_on_write = true,
        create_in_closed_folder = false,
        disable_netrw = true,
        hijack_cursor = true,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        open_on_tab = false,
        sort_by = "name",
        reload_on_bufenter = true,
        view = {
          adaptive_size = true,
          width = 25,
          side = "left",
          preserve_window_proportions = false,
          number = false,
          relativenumber = false,
          signcolumn = "yes", mappings = { custom_only = false,
            list = {
            },
          },
        },
        renderer = {
          add_trailing = false,
          group_empty = false,
          highlight_git = false,
          highlight_opened_files = "none",
          root_folder_modifier = ":~",
          root_folder_label = false,
          indent_markers = {
            enable = true,
            icons = {
              corner = "└ ",
              edge = "│ ",
              --item = "│ ",
              none = "  ",
            },
          },
          icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              folder = { arrow_closed = "", arrow_open = "", default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        },
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        system_open = {
          cmd = "",
          args = {},
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
        filters = {
          dotfiles = false,
          custom = {},
          exclude = {},
        },
        git = {
          enable = true,
          ignore = true,
          timeout = 400,
        },
        actions = {
          expand_all = {
            max_folder_discovery = 300,
          },
          open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
              enable = true,
              chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
              exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
            },
          },
          remove_file = {
            close_window = true,
          },
        },
        trash = {
          cmd = "trash",
          require_confirm = true,
        },
        live_filter = {
          prefix = "[FILTER]: ",
          always_show_folders = true,
        },
      }
    end,
  },
}
