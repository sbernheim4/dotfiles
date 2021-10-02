local compe = require 'compe'

compe.setup({
  enabled = true;
  preselect = 'always';
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    treesitter = true
  };
})

