" Vim color file
" Maintainer: bootleq <bootleq@gmail.com>
" Last Change: 2010-09-17
" Version: 0.2
"
" Summary:
" Modified from "slate" theme in 256 color term.
" Dark background, high contrast, similar color in cterm/gui, and avoid bold attribute in gui.
"
" Test:
" :ru syntax/hitest.vim
"
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "bootleg"

" UI colors {{{
  hi Normal       guifg=Gray           guibg=Black
  hi Cursor       guibg=#87ff00        guifg=Black
  hi CursorLine   cterm=NONE           ctermbg=234       guibg=#191919
  hi CursorColumn cterm=NONE           ctermbg=236       guibg=#191919
  hi ColorColumn  ctermbg=Black        guibg=Black
  "hi CursorIM     guibg=#87d7ff        guifg=#000000
  hi Visual       cterm=NONE           ctermbg=236       gui=NONE          guibg=#19194f
  hi VisualNOS    cterm=bold,underline
  hi LineNr       guifg=#afaf00        ctermfg=3
  hi SignColumn   ctermbg=Black        ctermfg=178       guibg=Black       guifg=#d7af00
  hi WildMenu     ctermfg=0            ctermbg=3
  hi VertSplit    gui=reverse          cterm=reverse
  hi Folded       ctermfg=248          ctermbg=237       guifg=#cccccc     guibg=#444444
  hi FoldColumn   guibg=#cccccc        guifg=Blue        ctermfg=4         ctermbg=7
  hi NonText      gui=NONE             guifg=blue        cterm=bold        ctermfg=blue
  hi SpecialKey   guifg=darkgreen      ctermfg=darkgreen
  hi StatusLine   guibg=White          guifg=Black       gui=NONE          cterm=bold,reverse
  hi StatusLineNC guibg=#999999        guifg=Black       gui=NONE          cterm=reverse
  hi User1        guibg=White          guifg=Blue        gui=NONE          ctermbg=Blue       cterm=bold,reverse
  hi Title        gui=NONE             guifg=gold        cterm=bold        ctermfg=yellow
  hi Search       ctermbg=22           ctermfg=White     guibg=#005500     guifg=White
  hi IncSearch    cterm=bold           ctermfg=124       ctermbg=40        gui=reverse        guifg=green        guibg=#87005f
  hi MatchParen   ctermbg=135          ctermfg=236       guibg=#af5fff     guifg=Black

  hi SpellErrors  cterm=underline      ctermfg=84        ctermbg=95        gui=undercurl
  hi SpellBad     cterm=underline      ctermfg=84        ctermbg=95        gui=undercurl
  hi SpellCap     cterm=underline      ctermfg=123       ctermbg=95        gui=undercurl
  hi SpellRare    cterm=underline      ctermfg=227       ctermbg=95        gui=undercurl
  hi SpellLocal   cterm=underline      ctermfg=255       ctermbg=95        gui=undercurl

  hi ModeMsg      gui=NONE             guifg=#af5f00     gui=NONE          cterm=NONE         ctermfg=brown
  hi MoreMsg      gui=NONE             guifg=darkgreen   ctermfg=darkgreen
  hi WarningMsg   guifg=#d70087        ctermfg=162
  hi ErrorMsg     guifg=White          guibg=#d70000     cterm=bold        ctermfg=7          ctermbg=1
  hi Error        guifg=White          guibg=#d70000     cterm=bold        ctermfg=7          ctermbg=1
  hi Question     gui=NONE             guifg=springgreen ctermfg=green

  hi qfSeparator  ctermfg=234          guifg=#191919
" }}} UI colors

" Syntax highlighting {{{
  hi Statement  gui=NONE         guifg=#5fd7ff    ctermfg=lightblue
  hi String     guifg=#5fbfaf    ctermfg=darkcyan
  hi Comment    ctermfg=103      guifg=#8787af
  hi Constant   guifg=#d75f00    ctermfg=brown
  hi Special    gui=NONE         guifg=#af5f00    ctermfg=brown
  hi Identifier guifg=#ff5050    ctermfg=red
  hi Function   guifg=#d75f5f    ctermfg=167
  hi PreProc    guifg=#ff5050    ctermfg=Red
  hi Include    guifg=#d78700    ctermfg=172
  hi Operator   guifg=Red        ctermfg=Red
  hi Define     guifg=gold       ctermfg=yellow
  hi Type       gui=NONE         guifg=#00d000    ctermfg=2
  hi Structure  guifg=green      ctermfg=green
  hi Todo       ctermfg=92       ctermbg=220      guifg=#8700d7     guibg=#ffd700
  hi Ignore     guifg=grey40     cterm=bold       ctermfg=7
  hi Conceal    ctermfg=240      ctermbg=Black    guifg=#585860     guibg=Black

  hi Directory  ctermfg=darkcyan

  hi Underlined cterm=underline  ctermfg=5
" }}} Syntax highlighting

" TabLine {{{
  hi TabLine           cterm=underline ctermfg=15    ctermbg=242   gui=underline        guibg=#6c6c6c guifg=White
  hi TabLineSel        cterm=bold      gui=NONE      guifg=White
  hi TabLineNr         cterm=underline ctermbg=238   gui=underline guibg=#444444
  hi TabLineNrSel      cterm=bold      ctermfg=45    guifg=#00d7ff
  hi TabLineFill       cterm=reverse   gui=reverse
  hi TabLineMore       cterm=underline ctermfg=White ctermbg=236   gui=underline        guifg=White   guibg=#303030
  hi TabLineSplitNr    cterm=underline ctermfg=148   ctermbg=240   gui=underline,italic guifg=#afd700 guibg=#6c6c6c
  hi TabLineSplitNrSel cterm=NONE      ctermfg=148   ctermbg=236   gui=NONE,italic      guifg=#afd700 guibg=#303030
" }}} TabLine

" Pmenu {{{
  hi Pmenu      ctermbg=53    ctermfg=172   guibg=#5f005f guifg=#d78700
  hi PmenuSel   ctermbg=234   ctermfg=220   guibg=#1c1c1c guifg=#ffd700
  hi PmenuSbar  ctermbg=Black guibg=Black
  hi PmenuThumb ctermbg=94    guibg=#875f00
" }}} Pmenu

" Diff {{{
  hi DiffAdd    ctermbg=4  guibg=#0000ca
  hi DiffChange ctermbg=53 guibg=#5f005f
  hi DiffDelete cterm=bold ctermfg=4     ctermbg=6     gui=NONE guibg=#5fd7d7
  hi DiffText   cterm=bold ctermbg=88    guibg=#870000 gui=NONE
" }}} Diff

" PHP {{{
  ":hi phpMethodsVar
" }}} PHP

" TagList {{{
  hi TagListFileName ctermbg=DarkGray ctermfg=White guibg=DarkGray guifg=White
" }}} TagList

" ShowMarks {{{
  hi ShowMarksHLl ctermfg=112 guifg=#87d700 gui=italic
  hi ShowMarksHLu ctermfg=118 guifg=#87ff00 gui=italic
  hi ShowMarksHLo ctermfg=110 guifg=#87afd7 gui=italic
  hi ShowMarksHLm ctermfg=199 guifg=#ff00af gui=italic
" }}} ShowMarks
