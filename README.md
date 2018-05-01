# yaq-vim

_vim Syntax Highlighting and Indenting Support for k and q/kdb+_

Yet another vim syntax highlighting for kdb+, forked from
[vim-qkdb-syntax](https://github.com/katusk/vim-qkdb-syntax) by
[katusk](https://github.com/katusk), which is derived from
[vim](https://github.com/simongarland/vim) by
[Simon Garland](https://github.com/simongarland).
There is additional inspiration from [qvim](https://github.com/patmok/qvim) by
[patmok](https://github.com/patmok).

This repo adds special highlighting for:
- Query keywords, `select`, `update`, `upsert`, `insert`, `exec`, `delete`,
 `by` and `from`.
- Local single and double letter variables, e.g. `x`, `y`, `z`, `d`, `t`, `xx`,
`yy`, `zz` (but exclude built in keywords like `aj` and `lj`).

## Installation
Copy [`.vimrc`](.vimrc) to `$HOME/.vimrc` if you don't have one already, or
copy the settings to your existing file.

Copy the files in the [`.vim`](.vim) subdirectory to your vim home directory
(probably `$HOME/.vim`).

If you already have a [`filetype.vim`](.vim/filetype.vim) then just insert the
additional k & q lines.

Copy the `\*.vim` files from [`syntax`](.vim/syntax) and [`indent`](.vim/indent)
to their corresponding directories, creating them if need be.

Most of the work is done in [`k.vim`](.vim/syntax/k.vim) (which is loaded into 
[`q.vim`](.vim/syntax/q.vim)) as q "only" adds the functions in `.q` as
primitives, and relaxes the restriction on underscores in names.
