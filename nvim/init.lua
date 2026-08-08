-- Basic Settings
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Show relative line numbers
vim.opt.tabstop = 2                  -- Number of spaces tabs count for
vim.opt.shiftwidth = 2               -- Size of an indent
vim.opt.expandtab = true             -- Use spaces instead of tabs
vim.opt.smartindent = true           -- Insert indents automatically
vim.opt.autoindent = true            -- Copy indent from current line when starting a new line
vim.opt.mouse = 'a'                  -- Enable mouse support
vim.opt.clipboard = 'unnamedplus'    -- Use system clipboard
vim.opt.termguicolors = true         -- Enable 24-bit RGB colors
vim.opt.showmode = false             -- Don't show mode since it's displayed in statusline
vim.opt.showcmd = true               -- Show (partial) command in the last line of the screen
vim.opt.cursorline = true            -- Highlight current line
vim.opt.wrap = false                 -- Don't wrap lines
vim.opt.breakindent = true           -- Wrapped lines will maintain indentation
vim.opt.ignorecase = true            -- Ignore case in search patterns
vim.opt.smartcase = true             -- Override ignorecase if search contains uppercase
vim.opt.incsearch = true             -- Show where the pattern matches as it is typed
vim.opt.hlsearch = true              -- Highlight all matches of the search pattern
vim.opt.swapfile = false             -- Don't use swapfile
vim.opt.backup = false               -- Don't create backup files
vim.opt.writebackup = false          -- Don't backup before overwriting a file
vim.opt.undofile = true              -- Persistent undo
vim.opt.signcolumn = 'yes'           -- Always show the signcolumn
vim.opt.updatetime = 300             -- Faster completion and better UX
vim.opt.timeoutlen = 500             -- Time to wait for a mapped sequence to complete

-- Set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Window navigation with Ctrl + hjkl
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Navigate window left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Navigate window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Navigate window up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Navigate window right' })

-- Resize window using Alt + hjkl
vim.keymap.set('n', '<M-h>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<M-j>', ':resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<M-k>', ':resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<M-l>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })

-- Better indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Outdent line' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent line' })

-- Move selected lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Clear search highlighting
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = 'Clear highlight' })

-- Save with leader key
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })

-- Enable syntax highlighting (this is enabled by default in Neovim)
vim.cmd('syntax enable')

-- Additional visual improvements
vim.opt.list = true                  -- Show some invisible characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- LSP: pyright for Python (go-to-definition, diagnostics)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function(args)
    vim.lsp.start({
      name = 'pyright',
      cmd = { 'pyright-langserver', '--stdio' },
      root_dir = vim.fs.root(args.buf, { '.git', 'pyproject.toml', 'setup.py' }) or vim.fn.getcwd(),
    })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  end,
})

-- Print a message to indicate the config has loaded
print("Neovim configuration loaded!")

