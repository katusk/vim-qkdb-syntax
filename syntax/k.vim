" Vim syntax file
" Language: k
" Maintainer: Simon Garland <simon@kx.com>
" Last Change: 2011.04.04

" Remove any old syntax stuff hanging around
syn clear

if !exists("main_syntax")
 let main_syntax = 'k'
endif

" sync, even k functions can ramble..
if main_syntax == 'k'
 if exists("k_minlines")
  exec "syn sync minlines=" . k_minlines
 else
  syn sync minlines=100
 endif
endif

setlocal comments=://,:/

" exclude _ in names for k
syn case match
set iskeyword=@,^_,48-57,.

" Operator
syn match kOperator /[/\']/
syn match kOperator /[/\']:/

" highlight Todo and friends in comments
syn keyword kTodo TODO FIXME FIX XXX NOTE GOTCHA contained

" Exit
syn match kExit "^\\\\" contained

" Comments, trailing, wholeline and multi-line
syn region kComment start="^\s*/" end="$" keepend excludenl contains=kTodo
syn region kComment start="\s/" end="$" keepend excludenl contains=kTodo
" multiline comment, bare \ means rest of file is comment
syn region kComment start="^\\\\*\s*$" end="\%$" contains=kTodo,kExit
" multiline comment start / .. end \
syn region kComment start="^/\s*$" end="^\\\s*$" keepend excludenl contains=kTodo
" emphasised comment
syn region kSpecialComment start="^\s*//" end="$" keepend excludenl contains=kTodo
syn region kSpecialComment start="\s//" end="$" keepend excludenl contains=kTodo

" Numbers, dates etc
syn match kNumber "-\=\(\d\+\)\=\.\d*\(e[+-]\=\d\+\)\=[ef]\="
syn match kNumber "-\=\d\+\(e[+-]\=\d\+\)\=[ijhfe]\="
" Timestamp
syn match kNumber "\d\{4}\.[01]\d\.[0123]\dT[012]\d\:[012345]\d:[012345]\d\(\.\d\+\)\="
" Month
syn match kNumber "\d\{4}\.[01]\dm"
" Time
syn match kNumber "[012]\d:[012345]\d\(:[012345]\d\(\.\d\+\)\=\)\="
" Hex
syn match kNumber "0x\x*"

" special functions 0: 1: 2:
syn match kFunction "\<[012]:"

" Boolean
syn match kBoolean /[01]\+b/

" generic .?.* match - single letter reserved namespace
" syn match kFunction /\.\a\.\a[a-zA-Z0-9]*/

"Statement separator
syn match kSeparator ";"

" all the nulls and INFs
syn keyword kSpecial 0N 0W 0n 0w
syn match kSpecial "-0[wW]"
syn match kSpecial "-0W[defhijmnptuvz]"
syn match kSpecial "0[NW][defghijmnptuvz]"
" GUIDs
syn match kSpecial "[-[:xdigit:]]\{36}"

" Identifiers not caught elsewhere
syn match kGlobal "\<\u[A-Z0-9]*\>"

syn match kIdentifier "\<[a-zA-Z\.][a-zA-Z0-9\.]*\>"

" k primitives from .Q.res
syn keyword kPrimitive abs
syn keyword kPrimitive acos
syn keyword kPrimitive asin
syn keyword kPrimitive atan
syn keyword kPrimitive avg
syn keyword kPrimitive bin
syn keyword kPrimitive binr
syn keyword kPrimitive by
syn keyword kPrimitive cor
syn keyword kPrimitive cos
syn keyword kPrimitive cov
syn keyword kPrimitive delete
syn keyword kPrimitive dev
syn keyword kPrimitive div
syn keyword kPrimitive do
syn keyword kPrimitive enlist
syn keyword kPrimitive exec
syn keyword kPrimitive exit
syn keyword kPrimitive exp
syn keyword kPrimitive from
syn keyword kPrimitive getenv
syn keyword kPrimitive if
syn keyword kPrimitive in
syn keyword kPrimitive insert
syn keyword kPrimitive last
syn keyword kPrimitive like
syn keyword kPrimitive log
syn keyword kPrimitive max
syn keyword kPrimitive min
syn keyword kPrimitive prd
syn keyword kPrimitive reval
syn keyword kPrimitive select
syn keyword kPrimitive setenv
syn keyword kPrimitive sin
syn keyword kPrimitive sqrt
syn keyword kPrimitive ss
syn keyword kPrimitive sum
syn keyword kPrimitive svar
syn keyword kPrimitive tan
syn keyword kPrimitive update
syn keyword kPrimitive var
syn keyword kPrimitive wavg
syn keyword kPrimitive while
syn keyword kPrimitive within
syn keyword kPrimitive wsum
syn keyword kPrimitive xexp

" catch invalid .?.?/?.??
syn match kError "\.[a-zA-Z]\.[a-zA-Z]*"

" fully qualified names from kx (single letter) namespaces
syn keyword qLib \.h\.HOME
syn keyword qLib \.h\.br
syn keyword qLib \.h\.c0
syn keyword qLib \.h\.c1
syn keyword qLib \.h\.cd
syn keyword qLib \.h\.code
syn keyword qLib \.h\.data
syn keyword qLib \.h\.eb
syn keyword qLib \.h\.ec
syn keyword qLib \.h\.ed
syn keyword qLib \.h\.edsn
syn keyword qLib \.h\.es
syn keyword qLib \.h\.ex
syn keyword qLib \.h\.fram
syn keyword qLib \.h\.ha
syn keyword qLib \.h\.hb
syn keyword qLib \.h\.hc
syn keyword qLib \.h\.he
syn keyword qLib \.h\.hn
syn keyword qLib \.h\.hp
syn keyword qLib \.h\.hr
syn keyword qLib \.h\.ht
syn keyword qLib \.h\.hta
syn keyword qLib \.h\.htac
syn keyword qLib \.h\.htc
syn keyword qLib \.h\.html
syn keyword qLib \.h\.http
syn keyword qLib \.h\.hu
syn keyword qLib \.h\.hug
syn keyword qLib \.h\.hy
syn keyword qLib \.h\.iso8601
syn keyword qLib \.h\.jx
syn keyword qLib \.h\.logo
syn keyword qLib \.h\.nbr
syn keyword qLib \.h\.pre
syn keyword qLib \.h\.sa
syn keyword qLib \.h\.sb
syn keyword qLib \.h\.sc
syn keyword qLib \.h\.td
syn keyword qLib \.h\.text
syn keyword qLib \.h\.tx
syn keyword qLib \.h\.ty
syn keyword qLib \.h\.uh
syn keyword qLib \.h\.xd
syn keyword qLib \.h\.xmp
syn keyword qLib \.h\.xs
syn keyword qLib \.h\.xt
syn keyword qLib \.j\.J
syn keyword qLib \.j\.e
syn keyword qLib \.j\.j
syn keyword qLib \.j\.k
syn keyword qLib \.j\.q
syn keyword qLib \.j\.s
syn keyword qLib \.o\.B0
syn keyword qLib \.o\.C0
syn keyword qLib \.o\.Cols
syn keyword qLib \.o\.Columns
syn keyword qLib \.o\.FG
syn keyword qLib \.o\.Fkey
syn keyword qLib \.o\.Gkey
syn keyword qLib \.o\.Key
syn keyword qLib \.o\.PS
syn keyword qLib \.o\.Special
syn keyword qLib \.o\.Stats
syn keyword qLib \.o\.T
syn keyword qLib \.o\.T0
syn keyword qLib \.o\.TI
syn keyword qLib \.o\.Tables
syn keyword qLib \.o\.Ts
syn keyword qLib \.o\.TypeInfo
syn keyword qLib \.o\.ex
syn keyword qLib \.o\.o
syn keyword qLib \.o\.t
syn keyword qLib \.q\.aj
syn keyword qLib \.q\.aj0
syn keyword qLib \.q\.all
syn keyword qLib \.q\.and
syn keyword qLib \.q\.any
syn keyword qLib \.q\.asc
syn keyword qLib \.q\.asof
syn keyword qLib \.q\.attr
syn keyword qLib \.q\.avgs
syn keyword qLib \.q\.ceiling
syn keyword qLib \.q\.cols
syn keyword qLib \.q\.count
syn keyword qLib \.q\.cross
syn keyword qLib \.q\.csv
syn keyword qLib \.q\.cut
syn keyword qLib \.q\.deltas
syn keyword qLib \.q\.desc
syn keyword qLib \.q\.differ
syn keyword qLib \.q\.distinct
syn keyword qLib \.q\.dsave
syn keyword qLib \.q\.each
syn keyword qLib \.q\.ej
syn keyword qLib \.q\.eval
syn keyword qLib \.q\.except
syn keyword qLib \.q\.fby
syn keyword qLib \.q\.fills
syn keyword qLib \.q\.first
syn keyword qLib \.q\.fkeys
syn keyword qLib \.q\.flip
syn keyword qLib \.q\.floor
syn keyword qLib \.q\.get
syn keyword qLib \.q\.group
syn keyword qLib \.q\.gtime
syn keyword qLib \.q\.hclose
syn keyword qLib \.q\.hcount
syn keyword qLib \.q\.hdel
syn keyword qLib \.q\.hopen
syn keyword qLib \.q\.hsym
syn keyword qLib \.q\.iasc
syn keyword qLib \.q\.idesc
syn keyword qLib \.q\.ij
syn keyword qLib \.q\.inter
syn keyword qLib \.q\.inv
syn keyword qLib \.q\.key
syn keyword qLib \.q\.keys
syn keyword qLib \.q\.lj
syn keyword qLib \.q\.ljf
syn keyword qLib \.q\.load
syn keyword qLib \.q\.lower
syn keyword qLib \.q\.lsq
syn keyword qLib \.q\.ltime
syn keyword qLib \.q\.ltrim
syn keyword qLib \.q\.mavg
syn keyword qLib \.q\.maxs
syn keyword qLib \.q\.mcount
syn keyword qLib \.q\.md5
syn keyword qLib \.q\.mdev
syn keyword qLib \.q\.med
syn keyword qLib \.q\.meta
syn keyword qLib \.q\.mins
syn keyword qLib \.q\.mmax
syn keyword qLib \.q\.mmin
syn keyword qLib \.q\.mmu
syn keyword qLib \.q\.mod
syn keyword qLib \.q\.msum
syn keyword qLib \.q\.neg
syn keyword qLib \.q\.next
syn keyword qLib \.q\.not
syn keyword qLib \.q\.null
syn keyword qLib \.q\.or
syn keyword qLib \.q\.over
syn keyword qLib \.q\.parse
syn keyword qLib \.q\.peach
syn keyword qLib \.q\.pj
syn keyword qLib \.q\.prds
syn keyword qLib \.q\.prev
syn keyword qLib \.q\.prior
syn keyword qLib \.q\.rand
syn keyword qLib \.q\.rank
syn keyword qLib \.q\.ratios
syn keyword qLib \.q\.raze
syn keyword qLib \.q\.read0
syn keyword qLib \.q\.read1
syn keyword qLib \.q\.reciprocal
syn keyword qLib \.q\.reval
syn keyword qLib \.q\.reverse
syn keyword qLib \.q\.rload
syn keyword qLib \.q\.rotate
syn keyword qLib \.q\.rsave
syn keyword qLib \.q\.rtrim
syn keyword qLib \.q\.save
syn keyword qLib \.q\.scan
syn keyword qLib \.q\.scov
syn keyword qLib \.q\.sdev
syn keyword qLib \.q\.set
syn keyword qLib \.q\.show
syn keyword qLib \.q\.signum
syn keyword qLib \.q\.ssr
syn keyword qLib \.q\.string
syn keyword qLib \.q\.sublist
syn keyword qLib \.q\.sums
syn keyword qLib \.q\.sv
syn keyword qLib \.q\.svar
syn keyword qLib \.q\.system
syn keyword qLib \.q\.tables
syn keyword qLib \.q\.til
syn keyword qLib \.q\.trim
syn keyword qLib \.q\.type
syn keyword qLib \.q\.uj
syn keyword qLib \.q\.ungroup
syn keyword qLib \.q\.union
syn keyword qLib \.q\.upper
syn keyword qLib \.q\.upsert
syn keyword qLib \.q\.value
syn keyword qLib \.q\.view
syn keyword qLib \.q\.views
syn keyword qLib \.q\.vs
syn keyword qLib \.q\.where
syn keyword qLib \.q\.wj
syn keyword qLib \.q\.wj1
syn keyword qLib \.q\.ww
syn keyword qLib \.q\.xasc
syn keyword qLib \.q\.xbar
syn keyword qLib \.q\.xcol
syn keyword qLib \.q\.xcols
syn keyword qLib \.q\.xdesc
syn keyword qLib \.q\.xgroup
syn keyword qLib \.q\.xkey
syn keyword qLib \.q\.xlog
syn keyword qLib \.q\.xprev
syn keyword qLib \.q\.xrank
syn keyword qLib \.Q\.A
syn keyword qLib \.Q\.Cf
syn keyword qLib \.Q\.IN
syn keyword qLib \.Q\.L
syn keyword qLib \.Q\.M
syn keyword qLib \.Q\.MAP
syn keyword qLib \.Q\.S
syn keyword qLib \.Q\.V
syn keyword qLib \.Q\.Xf
syn keyword qLib \.Q\.a
syn keyword qLib \.Q\.a0
syn keyword qLib \.Q\.a1
syn keyword qLib \.Q\.a2
syn keyword qLib \.Q\.addmonths
syn keyword qLib \.Q\.addr
syn keyword qLib \.Q\.an
syn keyword qLib \.Q\.b6
syn keyword qLib \.Q\.bv
syn keyword qLib \.Q\.chk
syn keyword qLib \.Q\.cn
syn keyword qLib \.Q\.d0
syn keyword qLib \.Q\.dd
syn keyword qLib \.Q\.def
syn keyword qLib \.Q\.dpft
syn keyword qLib \.Q\.dpt
syn keyword qLib \.Q\.dsftg
syn keyword qLib \.Q\.dt
syn keyword qLib \.Q\.en
syn keyword qLib \.Q\.f
syn keyword qLib \.Q\.fc
syn keyword qLib \.Q\.ff
syn keyword qLib \.Q\.fk
syn keyword qLib \.Q\.fl
syn keyword qLib \.Q\.fmt
syn keyword qLib \.Q\.foo
syn keyword qLib \.Q\.fp
syn keyword qLib \.Q\.fs
syn keyword qLib \.Q\.fsn
syn keyword qLib \.Q\.ft
syn keyword qLib \.Q\.fu
syn keyword qLib \.Q\.gc
syn keyword qLib \.Q\.hdpf
syn keyword qLib \.Q\.host
syn keyword qLib \.Q\.id
syn keyword qLib \.Q\.ind
syn keyword qLib \.Q\.j10
syn keyword qLib \.Q\.j12
syn keyword qLib \.Q\.k
syn keyword qLib \.Q\.l
syn keyword qLib \.Q\.n
syn keyword qLib \.Q\.nA
syn keyword qLib \.Q\.nct
syn keyword qLib \.Q\.opt
syn keyword qLib \.Q\.ord
syn keyword qLib \.Q\.p
syn keyword qLib \.Q\.p1
syn keyword qLib \.Q\.p2
syn keyword qLib \.Q\.par
syn keyword qLib \.Q\.pcnt
syn keyword qLib \.Q\.pf
syn keyword qLib \.Q\.pm
syn keyword qLib \.Q\.ps
syn keyword qLib \.Q\.pt
syn keyword qLib \.Q\.q0
syn keyword qLib \.Q\.qa
syn keyword qLib \.Q\.qb
syn keyword qLib \.Q\.qd
syn keyword qLib \.Q\.qe
syn keyword qLib \.Q\.qm
syn keyword qLib \.Q\.qp
syn keyword qLib \.Q\.qt
syn keyword qLib \.Q\.res
syn keyword qLib \.Q\.s
syn keyword qLib \.Q\.s1
syn keyword qLib \.Q\.s2
syn keyword qLib \.Q\.sw
syn keyword qLib \.Q\.t
syn keyword qLib \.Q\.t0
syn keyword qLib \.Q\.tab
syn keyword qLib \.Q\.tt
syn keyword qLib \.Q\.tx
syn keyword qLib \.Q\.ty
syn keyword qLib \.Q\.ua
syn keyword qLib \.Q\.v
syn keyword qLib \.Q\.view
syn keyword qLib \.Q\.vp
syn keyword qLib \.Q\.vt
syn keyword qLib \.Q\.w
syn keyword qLib \.Q\.x0
syn keyword qLib \.Q\.x1
syn keyword qLib \.Q\.x10
syn keyword qLib \.Q\.x12
syn keyword qLib \.Q\.x2
syn keyword qLib \.Q\.xy

" hardcode the .z. functions (no way to get them automatically)
syn match qLib "\.z\.D"
syn match qLib "\.z\.K"
syn match qLib "\.z\.N"
syn match qLib "\.z\.P"
syn match qLib "\.z\.T"
syn match qLib "\.z\.W"
syn match qLib "\.z\.Z"
syn match qLib "\.z\.a"
syn match qLib "\.z\.ac"
syn match qLib "\.z\.b"
syn match qLib "\.z\.bm"
syn match qLib "\.z\.c"
syn match qLib "\.z\.d"
syn match qLib "\.z\.exit"
syn match qLib "\.z\.f"
syn match qLib "\.z\.h"
syn match qLib "\.z\.i"
syn match qLib "\.z\.k"
syn match qLib "\.z\.l"
syn match qLib "\.z\.n"
syn match qLib "\.z\.o"
syn match qLib "\.z\.p"
syn match qLib "\.z\.pc"
syn match qLib "\.z\.pd"
syn match qLib "\.z\.pg"
syn match qLib "\.z\.ph"
syn match qLib "\.z\.pi"
syn match qLib "\.z\.pm"
syn match qLib "\.z\.po"
syn match qLib "\.z\.pp"
syn match qLib "\.z\.ps"
syn match qLib "\.z\.pw"
syn match qLib "\.z\.q"
syn match qLib "\.z\.s"
syn match qLib "\.z\.t"
syn match qLib "\.z\.ts"
syn match qLib "\.z\.u"
syn match qLib "\.z\.vs"
syn match qLib "\.z\.w"
syn match qLib "\.z\.ws"
syn match qLib "\.z\.wo"
syn match qLib "\.z\.wc"
syn match qLib "\.z\.x"
syn match qLib "\.z\.z"
syn match qLib "\.z\.zd"

"syn match kIdentifier "\<\a[a-zA-Z0-9]*\>"
"syn match kIdentifier "\<[a-zA-Z\.][a-zA-Z0-9\.]*\>"
syn match kPlaceholder "\<[xyz]\>"

" Conditional and similar constructs
syn keyword kConditional if
syn match kConditional /$\[/me=e-1
syn match kConditional /?\[/me=e-1
syn match kConditional /'\[/me=e-1
syn match kConditional /\.\[/me=e-1
syn match kConditional /@\[/me=e-1

" plist, view, global assign
syn match Function /::/

" Repeat
syn keyword kRepeat do while

" in a k script q) and s) switch to other languages, k) is unnecessary
syn match kLang "^q)"
syn match kLang "^s)"
syn match kError "^k)"

" symbols and specialcase file+connection handles
syn match kSymbol "\(`\<[a-zA-Z0-9\.][a-zA-Z0-9_\.]*\>\)"
syn match kHandle "\`:\{1,2}\([0-9a-zA-Z\\/.]\+:\=\)\{1,4}"

" attributes `p#, `g#, `s# and `u#
syn match kPreproc /`[spgu]#/

" highlight all the special names used when `XXX$ casting data
syn match kCast "\`\(boolean\|byte\|short\|int\|long\|real\|guid\|float\|char\|symbol\|timestamp\|month\|date\|datetime\|timespan\|time\|minute\|second\)\$\s*"
syn match kCast "\`\(year\|week\|mm\|dd\|hh\|ss\|uu\)\$\s*"

" system cmd
syn match kSyscmd "^\\\<\([12abBcCdeflopPrsStTuvwWxz_]\|cd\|ts\)\>"

" String and handle embedded tabs and newlines correctly
syn region kString start=+"+ skip=+\\\\\|\\"+ end=+"+ keepend excludenl matchgroup=None contains=kSpecialChar
syn match kSpecialChar "\\[abcfnrtv\\]" contained
" special singlechar string before $
syn match kCast /"\a"\$/

if !exists("did_k_syntax_inits")
 let did_k_syntax_inits = 1
 hi link kBoolean Boolean
 hi link kCast Type
 hi link kComment Comment
 hi link kConditional Conditional
 hi link kContext Directory
 hi link kError Error
 hi link kExit WarningMsg
 hi link kFunction Function
 hi link kGlobal Macro
 hi link kHandle TabLineSel
 hi link kIdentifier Normal
 hi link kLang Pmenu
 hi link kNumber Number
 hi link kOperator Operator
 hi link kPlaceholder Normal
 hi link kPreproc PreProc
 hi link kPrimitive kFunction
 hi link kRepeat Repeat
 hi link kSeparator Normal
 hi link kSpecial Special
 hi link kSpecialChar SpecialChar
 hi link kSpecialComment Comment
 hi link kString String
 hi link kSyscmd PmenuSel
 hi link kSymbol Constant
 hi link kTodo Todo
 hi link qLib Special
 endif

let b:current_syntax = "k"

if main_syntax == 'k'
 unlet main_syntax
endif
