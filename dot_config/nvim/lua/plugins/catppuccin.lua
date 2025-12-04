-- Stolen from https://gist.github.com/fang2hou/8f87a43c02c26463b1689736cbc3b09e
-- Found in https://github.com/catppuccin/nvim/discussions/323#discussioncomment-12522504
return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  opts = {
    background = {
      light = "latte",
      dark = "mocha",
    },
    color_overrides = {
      latte = {
        rosewater = "#dc8a78",
        flamingo = "#dd7878",
        pink = "#bd4c90",
        mauve = "#6e20c7",
        red = "#d20f39",
        maroon = "#af2837",
        peach = "#ab4d24",
        yellow = "#b16d00",
        green = "#317c21",
        teal = "#0d6469",
        sky = "#04a5e5",
        sapphire = "#209fb5",
        blue = "#14429e",
        lavender = "#5267dd",
        text = "#202020",
        subtext1 = "#3c3c3c",
        subtext0 = "#4e4e4e",
        overlay2 = "#646464",
        overlay1 = "#717171",
        overlay0 = "#575757",
        surface2 = "#b0b0b0",
        surface1 = "#c0c0c0",
        surface0 = "#d7d7d7",
        base = "#f1f1f1",
        mantle = "#ebebeb",
        crust = "#e0e0e0",
      },
      mocha = {
        rosewater = "#f4dbd6",
        flamingo = "#f0c6c6",
        pink = "#f5bde6",
        mauve = "#c6a0f6",
        red = "#fc8388",
        maroon = "#fd7ca9",
        peach = "#f5a885",
        yellow = "#eed49f",
        green = "#bdd486",
        teal = "#8cd5c4",
        sky = "#8ed9dd",
        sapphire = "#76c6df",
        blue = "#87c0f7",
        lavender = "#b7bdf8",
        text = "#e4e4e4",
        subtext1 = "#c1c1c1",
        subtext0 = "#aeaeae",
        overlay2 = "#9b9b9b",
        overlay1 = "#888888",
        overlay0 = "#757575",
        surface2 = "#525255",
        surface1 = "#3b3b3f",
        surface0 = "#28282c",
        base = "#222226",
        mantle = "#212125",
        crust = "#1d1d20",
      },
    },
    highlight_overrides = {
      all = function(c)
        local o = require("catppuccin").options
        local u = require("catppuccin.utils.colors")

        return {
          Comment = { fg = c.yellow, style = o.styles.comments }, -- just comments
          SpecialComment = { link = "Special" }, -- special things inside a comment
          ["@comment"] = { link = "Comment" },
          ["@comment.documentation"] = { link = "Comment" }, -- For comments documenting code

          ["@comment.error"] = { fg = c.base, bg = c.red },
          ["@comment.warning"] = { fg = c.base, bg = c.yellow },
          ["@comment.hint"] = { fg = c.base, bg = c.blue },
          ["@comment.todo"] = { fg = c.base, bg = c.flamingo },
          ["@comment.note"] = { fg = c.base, bg = c.rosewater },

          -- Language builtins (keywords, builtin types, directives, etc)
          Keyword = { fg = c.subtext0, style = o.styles.keywords or {} }, --  any other keyword
          Conditional = { link = "Keyword" }, --  if, then, else, endif, switch, etc.
          Repeat = { link = "Keyword" }, --   for, do, while, etc.
          Label = { link = "Keyword" }, --    case, default, etc.
          Include = { link = "Keyword" }, --  preprocessor #include
          Statement = { link = "Keyword" }, -- (preferred) any statement
          Exception = { link = "Keyword" }, --  try, catch, throw
          PreProc = { link = "Keyword" }, -- (preferred) generic Preprocessor
          Define = { link = "Keyword" }, -- preprocessor #define
          Macro = { link = "Keyword" }, -- same as Define
          PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.
          StorageClass = { link = "Keyword" }, -- static, register, volatile, etc.
          Structure = { link = "Keyword" }, --  struct, union, enum, etc.
          Type = { link = "Keyword" }, -- (preferred) int, long, char, etc.
          Typedef = { link = "Type" }, --  A typedef
          ["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
          ["@keyword.modifier"] = { link = "Keyword" }, -- For keywords modifying other constructs (e.g. `const`, `static`, `public`)
          ["@keyword.type"] = { link = "Keyword" }, -- For keywords describing composite types (e.g. `struct`, `enum`)
          ["@keyword.coroutine"] = { link = "Keyword" }, -- For keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
          ["@keyword.function"] = { link = "Keyword" }, -- For keywords used to define a function.
          ["@keyword.operator"] = { link = "Keyword" }, -- For new keyword operator
          ["@keyword.import"] = { link = "Include" }, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
          ["@keyword.repeat"] = { link = "Repeat" }, -- For keywords related to loops.
          ["@keyword.return"] = { link = "Keyword" },
          ["@keyword.debug"] = { link = "Exception" }, -- For keywords related to debugging
          ["@keyword.exception"] = { link = "Exception" }, -- For exception related keywords.
          ["@keyword.conditional"] = { link = "Conditional" }, -- For keywords related to conditionnals.
          ["@keyword.conditional.ternary"] = { link = "Operator" }, -- For ternary operators (e.g. `?` / `:`)
          ["@keyword.directive"] = { link = "PreProc" }, -- various preprocessor directives & shebangs
          ["@keyword.directive.define"] = { link = "Define" }, -- preprocessor definition directives
          ["@keyword.export"] = { link = "Keyword" }, -- JS and lua `export`

          -- Non-String Literals, known at compile time: Numbers, Booleans, Atoms, Symbols, the like
          NonStringLiteral = { fg = c.mauve },
          Constant = { fg = c.peach }, -- (preferred) any constant
          Boolean = { link = "NonStringLiteral" }, --  a boolean constant: TRUE, false
          ["@boolean"] = { link = "Boolean" }, -- For booleans.
          Number = { link = "NonStringLiteral" }, --   a number constant: 234, 0xff
          Float = { link = "Number" }, --    a floating point constant: 2.3e10
          ["@number"] = { link = "Number" }, -- For all numbers
          ["@number.float"] = { link = "Float" }, -- For floats.
          ["@variable.builtin"] = { link = "NonStringLiteral" }, -- Variable names that are defined by the languages, like this or self.
          rubyClassName = { link = "NonStringLiteral" },
          ["@constructor.python"] = { fg = c.sky }, -- __init__(), __new__().
          ["@string.special.symbol"] = { link = "NonStringLiteral" }, -- symbols or atoms
          ["@string.special.symbol.ruby"] = { link = "@string.special.symbol" },

          -- Strings
          String = { fg = c.green, style = o.styles.strings or {} }, -- a string constant: "this is a string"
          Character = { fg = c.teal }, --  a character constant: 'c', '\n'
          ["@string"] = { link = "String" }, -- For strings.
          ["@character"] = { link = "Character" }, -- character literals

          Identifier = { fg = c.flamingo, style = o.styles.variables or {} }, -- (preferred) any variable name
          Function = { fg = c.blue, style = o.styles.functions or {} }, -- function name (also: methods for classes)
          Operator = { fg = c.sky, style = o.styles.operators or {} }, -- "sizeof", "+", "*", etc.

          Special = { fg = c.pink }, -- (preferred) any special symbol
          SpecialChar = { link = "Special" }, -- special character in a constant
          Tag = { fg = c.lavender, style = { "bold" } }, -- you can use CTRL-] on this
          Delimiter = { fg = c.overlay2 }, -- character that needs attention

          Underlined = { style = { "underline" } }, -- (preferred) text that stands out, HTML links
          Bold = { style = { "bold" } },
          Italic = { style = { "italic" } },
          -- ("Ignore", below, may be invisible...)
          -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

          Error = { fg = c.red }, -- (preferred) any erroneous construct
          Todo = { bg = c.flamingo, fg = c.base, style = { "bold" } }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
          qfLineNr = { fg = c.yellow },
          qfFileName = { fg = c.blue },
          htmlH1 = { fg = c.pink, style = { "bold" } },
          htmlH2 = { fg = c.blue, style = { "bold" } },
          -- mkdHeading = { fg = c.peach, style = { "bold" } },
          -- mkdCode = { bg = c.terminal_black, fg = c.text },
          mkdCodeDelimiter = { bg = c.base, fg = c.text },
          mkdCodeStart = { fg = c.flamingo, style = { "bold" } },
          mkdCodeEnd = { fg = c.flamingo, style = { "bold" } },
          -- mkdLink = { fg = c.blue, style = { "underline" } },

          -- debugging
          Debug = { link = "Special" }, -- debugging statements
          debugPC = { bg = o.transparent_background and c.none or c.crust }, -- used for highlighting the current line in terminal-debug
          debugBreakpoint = { bg = c.base, fg = c.overlay0 }, -- used for breakpoint colors in terminal-debug
          -- illuminate
          illuminatedWord = { bg = c.surface1 },
          illuminatedCurWord = { bg = c.surface1 },

          -- diff
          Added = { fg = c.green },
          Changed = { fg = c.blue },
          diffAdded = { fg = c.green },
          diffRemoved = { fg = c.red },
          diffChanged = { fg = c.blue },
          diffOldFile = { fg = c.yellow },
          diffNewFile = { fg = c.peach },
          diffFile = { fg = c.blue },
          diffLine = { fg = c.overlay0 },
          diffIndexLine = { fg = c.teal },
          DiffAdd = { bg = u.darken(c.green, 0.18, c.base) }, -- diff mode: Added line |diff.txt|
          DiffChange = { bg = u.darken(c.blue, 0.07, c.base) }, -- diff mode: Changed line |diff.txt|
          DiffDelete = { bg = u.darken(c.red, 0.18, c.base) }, -- diff mode: Deleted line |diff.txt|
          DiffText = { bg = u.darken(c.blue, 0.30, c.base) }, -- diff mode: Changed text within a changed line |diff.txt|
          ["@diff.plus"] = { link = "diffAdded" }, -- added text (for diff files)
          ["@diff.minus"] = { link = "diffRemoved" }, -- deleted text (for diff files)
          ["@diff.delta"] = { link = "diffChanged" }, -- deleted text (for diff files)

          -- NeoVim
          healthError = { fg = c.red },
          healthSuccess = { fg = c.teal },
          healthWarning = { fg = c.yellow },
          -- misc

          -- glyphs
          GlyphPalette1 = { fg = c.red },
          GlyphPalette2 = { fg = c.teal },
          GlyphPalette3 = { fg = c.yellow },
          GlyphPalette4 = { fg = c.blue },
          GlyphPalette6 = { fg = c.teal },
          GlyphPalette7 = { fg = c.text },
          GlyphPalette9 = { fg = c.red },

          -- rainbow
          rainbow1 = { fg = c.red },
          rainbow2 = { fg = c.peach },
          rainbow3 = { fg = c.yellow },
          rainbow4 = { fg = c.green },
          rainbow5 = { fg = c.sapphire },
          rainbow6 = { fg = c.lavender },

          -- csv
          csvCol0 = { fg = c.red },
          csvCol1 = { fg = c.peach },
          csvCol2 = { fg = c.yellow },
          csvCol3 = { fg = c.green },
          csvCol4 = { fg = c.sky },
          csvCol5 = { fg = c.blue },
          csvCol6 = { fg = c.lavender },
          csvCol7 = { fg = c.mauve },
          csvCol8 = { fg = c.pink },

          -- markdown
          markdownHeadingDelimiter = { fg = c.peach, style = { "bold" } },
          markdownCode = { fg = c.flamingo },
          markdownCodeBlock = { fg = c.flamingo },
          markdownLinkText = { fg = c.blue, style = { "underline" } },
          markdownH1 = { link = "rainbow1" },
          markdownH2 = { link = "rainbow2" },
          markdownH3 = { link = "rainbow3" },
          markdownH4 = { link = "rainbow4" },
          markdownH5 = { link = "rainbow5" },
          markdownH6 = { link = "rainbow6" },

          -- Identifiers
          ["@variable"] = { fg = c.text, style = o.styles.variables or {} }, -- Any variable name that does not have another highlight.
          ["@variable.parameter"] = { link = "@variable" }, -- For parameters of a function.
          ["@variable.member"] = { link = "@variable" }, -- For fields.

          ["@constant"] = { link = "Constant" }, -- For constants
          ["@constant.builtin"] = { fg = c.peach, style = o.styles.keywords or {} }, -- For constant that are built in the language: nil in Lua.
          ["@constant.macro"] = { link = "Macro" }, -- For constants that are defined by macros: NULL in c.
          ["@constant.java"] = { fg = c.teal },

          ["@module"] = { fg = c.yellow, style = o.styles.miscs or { "italic" } }, -- For identifiers referring to modules and namespaces.
          ["@label"] = { link = "Label" }, -- For labels: label: in C and :label: in Lua.

          -- Literals
          ["@string.documentation"] = { fg = c.teal, style = o.styles.strings or {} }, -- For strings documenting code (e.g. Python docstrings).
          ["@string.regexp"] = { fg = c.pink, style = o.styles.strings or {} }, -- For regexes.
          ["@string.escape"] = { fg = c.pink, style = o.styles.strings or {} }, -- For escape characters within a string.
          ["@string.special"] = { link = "Special" }, -- other special strings (e.g. dates)
          ["@string.special.path"] = { link = "Special" }, -- filenames
          ["@string.special.url"] = { fg = c.blue, style = { "italic", "underline" } }, -- urls, links and emails
          ["@punctuation.delimiter.regex"] = { link = "@string.regexp" },

          ["@character.special"] = { link = "SpecialChar" }, -- special characters (e.g. wildcards)

          -- Types
          ["@type"] = { link = "Constant" }, -- For types.
          ["@type.builtin"] = { link = "Keyword" }, -- For builtin types.
          ["@type.definition"] = { link = "Type" }, -- type definitions (e.g. `typedef` in C)

          ["@attribute"] = { link = "Constant" }, -- attribute annotations (e.g. Python decorators)
          ["@property"] = { fg = c.lavender, style = o.styles.properties or {} }, -- For fields, like accessing `bar` property on `foo.bar`. Overriden later for data languages and CSS.

          -- Functions
          ["@function"] = { link = "Function" }, -- For function (calls and definitions).
          ["@function.builtin"] = { link = "Keyword" }, -- For builtin functions: table.insert in Lua.
          ["@function.call"] = { link = "Function" }, -- function calls
          ["@function.macro"] = { fg = c.pink, style = o.styles.functions or {} }, -- For macro defined functions (calls and definitions): each macro_rules in Rust.

          ["@function.method"] = { link = "Function" }, -- For method definitions.
          ["@function.method.call"] = { link = "Function" }, -- For method calls.

          ["@constructor"] = { fg = c.yellow }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
          ["@operator"] = { link = "Operator" }, -- For any operator: +, but also -> and * in c.

          -- Punctuation
          ["@punctuation.delimiter"] = { link = "Delimiter" }, -- For delimiters (e.g. `;` / `.` / `,`).
          ["@punctuation.bracket"] = { fg = c.overlay2 }, -- For brackets and parenthesis.
          ["@punctuation.special"] = { link = "Special" }, -- For special punctuation that does not fall in the categories before (e.g. `{}` in string interpolation).

          -- Markup
          ["@markup"] = { fg = c.text }, -- For strings considerated text in a markup language.
          ["@markup.strong"] = { fg = c.red, style = { "bold" } }, -- bold
          ["@markup.italic"] = { fg = c.red, style = { "italic" } }, -- italic
          ["@markup.strikethrough"] = { fg = c.text, style = { "strikethrough" } }, -- strikethrough text
          ["@markup.underline"] = { link = "Underlined" }, -- underlined text

          ["@markup.heading"] = { fg = c.blue }, -- titles like: # Example
          ["@markup.heading.markdown"] = { style = { "bold" } }, -- bold headings in markdown, but not in HTML or other markup

          ["@markup.math"] = { fg = c.blue }, -- math environments (e.g. `$ ... $` in LaTeX)
          ["@markup.quote"] = { fg = c.pink }, -- block quotes
          ["@markup.environment"] = { fg = c.pink }, -- text environments of markup languages
          ["@markup.environment.name"] = { fg = c.blue }, -- text indicating the type of an environment

          ["@markup.link"] = { fg = c.lavender }, -- text references, footnotes, citations, etc.
          ["@markup.link.label"] = { fg = c.lavender }, -- link, reference descriptions
          ["@markup.link.url"] = { fg = c.blue, style = { "italic", "underline" } }, -- urls, links and emails

          ["@markup.raw"] = { fg = c.green }, -- used for inline code in markdown and for doc in python (""")

          ["@markup.list"] = { fg = c.teal },
          ["@markup.list.checked"] = { fg = c.green }, -- todo notes
          ["@markup.list.unchecked"] = { fg = c.overlay1 }, -- todo notes

          -- Tags
          ["@tag"] = { fg = c.blue }, -- Tags like HTML tag names.
          ["@tag.builtin"] = { fg = c.blue }, -- JSX tag names.
          ["@tag.attribute"] = { fg = c.yellow, style = o.styles.miscs or { "italic" } }, -- XML/HTML attributes (foo in foo="bar").
          ["@tag.delimiter"] = { fg = c.teal }, -- Tag delimiter like < > /

          -- Misc
          ["@error"] = { link = "Error" },

          -- Language specific:

          -- Bash
          ["@function.builtin.bash"] = { fg = c.red, style = o.styles.miscs or { "italic" } },
          ["@variable.parameter.bash"] = { fg = c.green },

          -- markdown
          ["@markup.heading.1.markdown"] = { link = "rainbow1" },
          ["@markup.heading.2.markdown"] = { link = "rainbow2" },
          ["@markup.heading.3.markdown"] = { link = "rainbow3" },
          ["@markup.heading.4.markdown"] = { link = "rainbow4" },
          ["@markup.heading.5.markdown"] = { link = "rainbow5" },
          ["@markup.heading.6.markdown"] = { link = "rainbow6" },

          -- html
          ["@markup.heading.html"] = { link = "@markup" },
          ["@markup.heading.1.html"] = { link = "@markup" },
          ["@markup.heading.2.html"] = { link = "@markup" },
          ["@markup.heading.3.html"] = { link = "@markup" },
          ["@markup.heading.4.html"] = { link = "@markup" },
          ["@markup.heading.5.html"] = { link = "@markup" },
          ["@markup.heading.6.html"] = { link = "@markup" },

          -- Java

          -- CSS
          ["@property.css"] = { fg = c.blue },
          ["@property.scss"] = { fg = c.blue },
          ["@property.id.css"] = { fg = c.yellow },
          ["@property.class.css"] = { fg = c.yellow },
          ["@type.css"] = { fg = c.lavender },
          ["@type.tag.css"] = { fg = c.blue },
          ["@string.plain.css"] = { fg = c.text },
          ["@number.css"] = { fg = c.peach },
          ["@keyword.directive.css"] = { link = "Keyword" }, -- CSS at-rules: https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule.

          -- HTML
          ["@string.special.url.html"] = { fg = c.green }, -- Links in href, src attributes.
          ["@markup.link.label.html"] = { fg = c.text }, -- Text between <a></a> tags.
          ["@character.special.html"] = { fg = c.red }, -- Symbols such as &nbsp;.

          -- Lua
          ["@constructor.lua"] = { link = "@punctuation.bracket" }, -- For constructor calls and definitions: = { } in Lua.

          -- Python

          -- YAML
          ["@label.yaml"] = { fg = c.yellow }, -- Anchor and alias names.

          -- PHP
          ["@function.method.php"] = { link = "Function" },
          ["@function.method.call.php"] = { link = "Function" },

          -- C/CPP
          ["@keyword.import.c"] = { fg = c.yellow },
          ["@keyword.import.cpp"] = { fg = c.yellow },

          -- C#
          ["@attribute.c_sharp"] = { fg = c.yellow },

          -- gitcommit
          ["@comment.warning.gitcommit"] = { fg = c.yellow },

          -- gitignore
          ["@string.special.path.gitignore"] = { fg = c.text },
        }
      end,
    },
    transparent_background = false,
    show_end_of_buffer = false,
    integrations = {
      window_picker = true,
      diffview = true,
    },
  },
}
