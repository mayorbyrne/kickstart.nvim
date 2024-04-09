-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  { 'github/copilot.vim' },
  { 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup {
        options = {
          diagnostics = "nvim_lsp",
        },

      }
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      local powershell_options = {
        shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or 'powershell',
        shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
        shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
        shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
        shellquote = '',
        shellxquote = '',
      }
      for option, value in pairs(powershell_options) do
        vim.opt[option] = value
      end

      require('toggleterm').setup {
        direction = "float",
      }
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-project.nvim',
  },
  {

    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '┊',
      },
      whitespace = {
        remove_blankline_trail = false,
      },
      exclude = {
        filetypes = {
          'lspinfo',
          'packer',
          'checkhealth',
          'help',
          'man',
          'dashboard',
          '',
        },
      },
    },
  },
  {
    'MunifTanjim/prettier.nvim',
    config = function()
      require('prettier').setup {
        bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
        filetypes = {
          'css',
          'graphql',
          'html',
          'javascript',
          'javascriptreact',
          'json',
          'less',
          'markdown',
          'scss',
          'typescript',
          'typescriptreact',
          'yaml',
        },
      }
    end,
  },
  {
    'Pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup {}
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    config = function()
      local c = require('vscode.colors').get_colors()
      require('vscode').setup {
        -- Alternatively set style in setup
        -- style = 'light'

        -- Enable transparent background
        transparent = true,

        -- Enable italic comment
        italic_comments = true,

        -- Underline `@markup.link.*` variants
        underline_links = true,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
          vscLineNumber = '#555555',
        },

        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      }
      require('vscode').load()
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()

      local kevin = require('custom.kevin')

      require('dashboard').setup {
        theme = 'doom',
        config = {
header = vim.split([[
                                                                    
     *****                                                          
  ******                                         *                  
 **   *  *    **                  **            ***                 
*    *  *   **** *                **             *                  
    *  *     ****                  **    ***                        
   ** **    * **           ***      **    ***  ***     ***  ****    
   ** **   *              * ***     **     ***  ***     **** **** * 
   ** *****              *   ***    **      **   **      **   ****  
   ** ** ***            **    ***   **      **   **      **    **   
   ** **   ***          ********    **      **   **      **    **   
   *  **    ***         *******     **      **   **      **    **   
      *       ***       **          **      *    **      **    **   
  ****         ***      ****    *    *******     **      **    **   
 *  *****        ***  *  *******      *****      *** *   ***   ***  
*    ***           ***    *****                   ***     ***   *** 
*                                                                   






]], "\n"),          center = {
            {
              icon = ' ',
              icon_hl = 'DiagnosticHint',
              desc = 'New File           ',
              desc_hl = 'DiagnosticHint',
              key = 'n',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'ene',
            },
            {
              icon = ' ',
              icon_hl = 'DiagnosticHint',
              desc = 'Recent Files       ',
              desc_hl = 'DiagnosticHint',
              key = 'r',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope oldfiles',
            },
            {
              icon = ' ',
              icon_hl = 'DiagnosticHint',
              desc = 'Open Projects      ',
              desc_hl = 'DiagnosticHint',
              key = 'p',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope project',
            },
            {
              icon = ' ',
              icon_hl = 'DiagnosticHint',
              desc = 'Edit Config        ',
              desc_hl = 'DiagnosticHint',
              key = 'e',
              key_format = ' %s', -- remove default surrounding `[]`
              action = kevin.editCfg.editCfg
            },
            {
              icon = ' ',
              icon_hl = 'DiagnosticHint',
              desc = 'Quit               ',
              desc_hl = 'DiagnosticHint',
              key = 'q',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'quit',
            },
          },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { '', '', '', '', '', 'Startup Time: ' .. ms .. ' ms', 'Plugins: ' .. stats.loaded .. ' loaded / ' .. stats.count .. ' installed' }
          end,
        },
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
      }
    end,
  },
  {
    'tpope/vim-fugitive',
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      mode = "document_diagnostics",
      icons = false,
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'echasnovski/mini.map',
    version = false,
    config = function()
      require('mini.map').setup({})
    end,
  },
}
