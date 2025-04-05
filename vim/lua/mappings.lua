-- ########################################################################
-- Custom Functions
-- ########################################################################

local function toggle_sign_column()
  if vim.o.signcolumn == "no" then
    vim.o.signcolumn = "yes"
  else
    vim.o.signcolumn = "no"
  end
end

local function toggle_text_width()
  if vim.o.colorcolumn == "" then
    vim.o.colorcolumn = "60,80"
  else
    vim.o.colorcolumn = ""
  end
end

local function toggle_relative_line_numbers()
  vim.o.relativenumber = not vim.o.relativenumber
end

local function toggle_indent_type()
  vim.o.expandtab = not vim.o.expandtab
end

local function get_buffer_list()
  return vim.fn.execute('ls!')
end

local function toggle_list(bufname, pfx)
  local buflist = get_buffer_list()
  for _, line in ipairs(vim.fn.split(buflist, '\n')) do
    if string.find(line, bufname) then
      local bufnum = tonumber(string.match(line, '%d+'))
      if vim.fn.bufwinnr(bufnum) ~= -1 then
        vim.cmd(pfx .. 'close')
        return
      end
    end
  end
  vim.cmd(pfx .. 'open')
end

-- ########################################################################
-- Keymaps
-- ########################################################################

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window movement
map('n', '<C-j>', '<C-W><C-J>', opts)
map('n', '<C-k>', '<C-W><C-K>', opts)
map('n', '<C-l>', '<C-W><C-L>', opts)
map('n', '<C-h>', '<C-W><C-H>', opts)

-- Resize windows with arrow keys
map('n', '<LEFT>', ':2 wincmd <<CR>', opts)
map('n', '<RIGHT>', ':2 wincmd ><CR>', opts)
map('n', '<UP>', ':2 wincmd +<CR>', opts)
map('n', '<DOWN>', ':2 wincmd -<CR>', opts)

-- Wrapped line navigation
map('', 'j', 'gj', opts)
map('', 'k', 'gk', opts)

-- Toggle commands
map('n', '<Leader>sc', toggle_sign_column, { desc = 'Toggle sign column' })
map('n', '<Leader>wr', ':set wrap!<CR>', opts)
map('n', '<Leader>hl', ':set hlsearch!<CR>', opts)
map('n', '<Leader>t', toggle_indent_type, { desc = 'Toggle indent type' })
map('n', '<Leader><Leader>rn', toggle_relative_line_numbers, { desc = 'Toggle relative line numbers' })
map('n', 'tw', toggle_text_width, { desc = 'Toggle text width column' })

-- Folding
map('n', '<Leader>f', 'zR', opts)
map('n', '<Leader>g', 'zM', opts)

-- Buffers and windows
map('n', '<Leader>n', ':bn<CR>', opts)
map('n', '<Leader>p', ':bp<CR>', opts)
map('n', '<Leader>q', ':bp <BAR> bd #<CR>', opts)

map('n', '<Leader>vp', ':vsplit<CR>', opts)
map('n', '<Leader>hp', ':split<CR>', opts)

map('n', '<Leader>vs', ':vertical resize +<CR>', opts)
map('n', '<Leader>hs', ':resize +<CR>', opts)

-- Move selected lines
map('v', 'J', ":move '>+1<CR>gv=gv", opts)
map('v', 'K', ":move '<-2<CR>gv=gv", opts)

-- Move splits
map('n', '<Leader>ah', '<C-W>H', opts)
map('n', '<Leader>aj', '<C-W>J', opts)
map('n', '<Leader>ak', '<C-W>K', opts)
map('n', '<Leader>al', '<C-W>L', opts)

-- Misc
map('n', '<Leader>r', ':source ~/.vimrc<CR>', opts)
map('n', '<Leader>pwf', ':echo expand("%:p")<CR>', opts)

map('n', 'ss{', 'vi{:sort<CR>', opts)
map('n', 'ss(', 'vi(:sort<CR>', opts)
map('n', 'ss<', 'vi<:sort<CR>', opts)
map('n', 'ss[', 'vi[:sort<CR>', opts)

-- Delete trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = [[%s/\s\+$//e]]
})

-- Visual search for selected text
map('v', '//', 'y/\\M<C-R>"<CR>', opts)

map('n', '*', '*N', opts)

-- DelimitMate enter compatibility (if using it)
-- map('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "<Plug>delimitMateCR"', { expr = true })

-- Format on insert-mode "jj"
map('i', 'jj', '<ESC>:lua vim.lsp.buf.format()<CR>:w<CR>', opts)

-- Toggle folds
map({ 'n', 'v' }, '<Space>', 'za', opts)
