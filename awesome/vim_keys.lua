
local my_vim_keys = {

    ["VIM: zlepšováky"] = {{
        modifiers = {},
        keys = {
            ['caw']="change a word under cursor",
            ['_d']='delete without yank',
        }
    }, 
    -- {
    --     modifiers = {"Ctrl"},
    --     keys = {
    --         u="half page up",
    --     }
    -- }
    },
    ["VIM: search"] = {{
        modifiers = {},
        keys = {
            ['*']="search the word under cursor",
            [':s']="search on the line",
            [':%s']="search in the file",
            [':%s/pattern/replace/flags']="flags: c=confirm, i=case_insensitive, g=replace_all", 
            ['N']="previous search",
        }
    }},
}

return my_vim_keys
