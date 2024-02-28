-- #######################################################################
-- ######## Folding
-- ########################################################################

vim.o.foldmethod = "expr"
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

vim.o.foldcolumn = "0"
vim.o.foldlevelstart = 99

vim.opt.fillchars = { eob = "-", fold = " " }
vim.opt.viewoptions:remove("options")

function _G.custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local nextLine = vim.fn.getline(vim.v.foldstart + 1)

    -- parse comment
    if (string.find(line, "/*")) then

        if (containsString(nextLine, "description") ~= nil) then
            return string.sub(nextLine, containsString(nextLine, "description") + 12, nextLine:len() - 1)
        elseif (containsString(nextLine, "*") ~= nil) then
            return string.sub(nextLine, containsString(nextLine, "*") + 2, nextLine:len() - 1)
        else
            return nextLine
        end

        return nextLine
    end

    -- Return the default treesitter folded text - this is for code
    return vim.treesitter.foldtext()
end

vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.fillchars = { eob = "-", fold = " " }

function _G.containsString(text, match)
    local lowerText = string.lower(text)
    local lowerMatch = string.lower(match)
    local descriptionIndex = lowerText:find(lowerMatch, 1, true);
    return descriptionIndex
end
