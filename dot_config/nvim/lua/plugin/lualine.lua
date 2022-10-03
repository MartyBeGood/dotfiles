require('lualine').setup({
    options = {
        -- theme = 'auto',
        theme = require('ofirkai.statuslines.lualine').theme,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''}
    }
})
