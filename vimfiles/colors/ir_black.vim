From: "Saved by Windows Internet Explorer 8"
Subject: 
Date: Fri, 6 Nov 2009 15:36:06 -0800
MIME-Version: 1.0
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Content-Location: http://blog.infinitered.com/entry_files/8/ir_black.vim
X-MimeOLE: Produced By Microsoft MimeOLE V6.1.7600.16385

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dwindows-1252" =
http-equiv=3DContent-Type>
<META name=3DGENERATOR content=3D"MSHTML 8.00.7600.16419"></HEAD>
<BODY><PRE>" ir_black color scheme
" More at: http://blog.infinitered.com/entries/show/8


" =
*************************************************************************=
*******
" Standard colors used in all ir_black themes:
" Note, x:x:x are RGB values
"
"  normal: #f6f3e8
"=20
"  string: #A8FF60  168:255:96                  =20
"    string inner (punc, code, etc): #00A0A0  0:160:160
"  number: #FF73FD  255:115:253                =20
"  comments: #7C7C7C  124:124:124
"  keywords: #96CBFE  150:203:254            =20
"  operators: white
"  class: #FFFFB6  255:255:182
"  method declaration name: #FFD2A7  255:210:167
"  regular expression: #E9C062  233:192:98
"    regexp alternate: #FF8000  255:128:0
"    regexp alternate 2: #B18A3D  177:138:61
"  variable: #C6C5FE  198:197:254
" =20
" Misc colors:
"  red color (used for whatever): #FF6C60   255:108:96=20
"     light red: #FFB6B0   255:182:176
"
"  brown: #E18964  good for special
"
"  lightpurpleish: #FFCCFF
"=20
" Interface colors:
"  background color: black
"  cursor (where underscore is used): #FFA560  255:165:96
"  cursor (where block is used): white
"  visual selection: #1D1E2C =20
"  current line: #151515  21:21:21
"  search selection: #07281C  7:40:28
"  line number: #3D3D3D  61:61:61


" =
*************************************************************************=
*******
" The following are the preferred 16 colors for your terminal
"           Colors      Bright Colors
" Black     #4E4E4E     #7C7C7C
" Red       #FF6C60     #FFB6B0
" Green     #A8FF60     #CEFFAB
" Yellow    #FFFFB6     #FFFFCB
" Blue      #96CBFE     #FFFFCB
" Magenta   #FF73FD     #FF9CFE
" Cyan      #C6C5FE     #DFDFFE
" White     #EEEEEE     #FFFFFF


" =
*************************************************************************=
*******
set background=3Ddark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name =3D "ir_black"


"hi Example         guifg=3DNONE        guibg=3DNONE        gui=3DNONE   =
   ctermfg=3DNONE        ctermbg=3DNONE        cterm=3DNONE

" General colors
hi Normal           guifg=3D#f6f3e8     guibg=3Dblack       gui=3DNONE   =
   ctermfg=3DNONE        ctermbg=3DNONE        cterm=3DNONE
hi NonText          guifg=3D#070707     guibg=3Dblack       gui=3DNONE   =
   ctermfg=3Dblack       ctermbg=3DNONE        cterm=3DNONE

hi Cursor           guifg=3Dblack       guibg=3Dwhite       gui=3DNONE   =
   ctermfg=3Dblack       ctermbg=3Dwhite       cterm=3Dreverse
hi LineNr           guifg=3D#3D3D3D     guibg=3Dblack       gui=3DNONE   =
   ctermfg=3Ddarkgray    ctermbg=3DNONE        cterm=3DNONE

hi VertSplit        guifg=3D#202020     guibg=3D#202020     gui=3DNONE   =
   ctermfg=3Ddarkgray    ctermbg=3Ddarkgray    cterm=3DNONE
hi StatusLine       guifg=3D#CCCCCC     guibg=3D#202020     gui=3Ditalic =
   ctermfg=3Dwhite       ctermbg=3Ddarkgray    cterm=3DNONE
hi StatusLineNC     guifg=3Dblack       guibg=3D#202020     gui=3DNONE   =
   ctermfg=3Dblue        ctermbg=3Ddarkgray    cterm=3DNONE =20

hi Folded           guifg=3D#a0a8b0     guibg=3D#384048     gui=3DNONE   =
   ctermfg=3DNONE        ctermbg=3DNONE        cterm=3DNONE
hi Title            guifg=3D#f6f3e8     guibg=3DNONE        gui=3Dbold   =
   ctermfg=3DNONE        ctermbg=3DNONE        cterm=3DNONE
hi Visual           guifg=3DNONE        guibg=3D#262D51     gui=3DNONE   =
   ctermfg=3DNONE        ctermbg=3Ddarkgray    cterm=3DNONE

hi SpecialKey       guifg=3D#808080     guibg=3D#343434     gui=3DNONE   =
   ctermfg=3DNONE        ctermbg=3DNONE        cterm=3DNONE

hi WildMenu         guifg=3Dgreen       guibg=3Dyellow      gui=3DNONE   =
   ctermfg=3Dblack       ctermbg=3Dyellow      cterm=3DNONE
hi PmenuSbar        guifg=3Dblack       guibg=3Dwhite       gui=3DNONE   =
   ctermfg=3Dblack       ctermbg=3Dwhite       cterm=3DNONE
"hi Ignore           guifg=3Dgray        guibg=3Dblack       gui=3DNONE  =
    ctermfg=3DNONE        ctermbg=3DNONE        cterm=3DNONE

hi Error            guifg=3DNONE        guibg=3DNONE        =
gui=3Dundercurl ctermfg=3Dwhite       ctermbg=3Dred         cterm=3DNONE =
    guisp=3D#FF6C60 " undercurl color
hi ErrorMsg         guifg=3Dwhite       guibg=3D#FF6C60     gui=3DBOLD   =
   ctermfg=3Dwhite       ctermbg=3Dred         cterm=3DNONE
hi WarningMsg       guifg=3Dwhite       guibg=3D#FF6C60     gui=3DBOLD   =
   ctermfg=3Dwhite       ctermbg=3Dred         cterm=3DNONE

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=3Dblack       guibg=3D#C6C5FE     gui=3DBOLD   =
   ctermfg=3Dblack       ctermbg=3Dcyan        cterm=3DBOLD

if version &gt;=3D 700 " Vim 7.x specific colors
  hi CursorLine     guifg=3DNONE        guibg=3D#121212     gui=3DNONE   =
   ctermfg=3DNONE        ctermbg=3DNONE        cterm=3DBOLD
  hi CursorColumn   guifg=3DNONE        guibg=3D#121212     gui=3DNONE   =
   ctermfg=3DNONE        ctermbg=3DNONE        cterm=3DBOLD
  hi MatchParen     guifg=3D#f6f3e8     guibg=3D#857b6f     gui=3DBOLD   =
   ctermfg=3Dwhite       ctermbg=3Ddarkgray    cterm=3DNONE
  hi Pmenu          guifg=3D#f6f3e8     guibg=3D#444444     gui=3DNONE   =
   ctermfg=3DNONE        ctermbg=3DNONE        cterm=3DNONE
  hi PmenuSel       guifg=3D#000000     guibg=3D#cae682     gui=3DNONE   =
   ctermfg=3DNONE        ctermbg=3DNONE        cterm=3DNONE
  hi Search         guifg=3DNONE        guibg=3DNONE        =
gui=3Dunderline ctermfg=3DNONE        ctermbg=3DNONE        =
cterm=3Dunderline
endif

" Syntax highlighting
hi Comment          guifg=3D#7C7C7C     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Ddarkgray    ctermbg=3DNONE        cterm=3DNONE
hi String           guifg=3D#A8FF60     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dgreen       ctermbg=3DNONE        cterm=3DNONE
hi Number           guifg=3D#FF73FD     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dmagenta     ctermbg=3DNONE        cterm=3DNONE

hi Keyword          guifg=3D#96CBFE     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dblue        ctermbg=3DNONE        cterm=3DNONE
hi PreProc          guifg=3D#96CBFE     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dblue        ctermbg=3DNONE        cterm=3DNONE
hi Conditional      guifg=3D#6699CC     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dblue        ctermbg=3DNONE        cterm=3DNONE  " if else =
end

hi Todo             guifg=3D#8f8f8f     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dred         ctermbg=3DNONE        cterm=3DNONE
hi Constant         guifg=3D#99CC99     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dcyan        ctermbg=3DNONE        cterm=3DNONE

hi Identifier       guifg=3D#C6C5FE     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dcyan        ctermbg=3DNONE        cterm=3DNONE
hi Function         guifg=3D#FFD2A7     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dbrown       ctermbg=3DNONE        cterm=3DNONE
hi Type             guifg=3D#FFFFB6     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dyellow      ctermbg=3DNONE        cterm=3DNONE
hi Statement        guifg=3D#6699CC     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dlightblue   ctermbg=3DNONE        cterm=3DNONE

hi Special          guifg=3D#E18964     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dwhite       ctermbg=3DNONE        cterm=3DNONE
hi Delimiter        guifg=3D#00A0A0     guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dcyan        ctermbg=3DNONE        cterm=3DNONE
hi Operator         guifg=3Dwhite       guibg=3DNONE        gui=3DNONE   =
   ctermfg=3Dwhite       ctermbg=3DNONE        cterm=3DNONE

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special


" Special for Ruby
hi rubyRegexp                  guifg=3D#B18A3D      guibg=3DNONE      =
gui=3DNONE      ctermfg=3Dbrown          ctermbg=3DNONE      =
cterm=3DNONE
hi rubyRegexpDelimiter         guifg=3D#FF8000      guibg=3DNONE      =
gui=3DNONE      ctermfg=3Dbrown          ctermbg=3DNONE      =
cterm=3DNONE
hi rubyEscape                  guifg=3Dwhite        guibg=3DNONE      =
gui=3DNONE      ctermfg=3Dcyan           ctermbg=3DNONE      =
cterm=3DNONE
hi rubyInterpolationDelimiter  guifg=3D#00A0A0      guibg=3DNONE      =
gui=3DNONE      ctermfg=3Dblue           ctermbg=3DNONE      =
cterm=3DNONE
hi rubyControl                 guifg=3D#6699CC      guibg=3DNONE      =
gui=3DNONE      ctermfg=3Dblue           ctermbg=3DNONE      =
cterm=3DNONE  "and break, etc
"hi rubyGlobalVariable          guifg=3D#FFCCFF      guibg=3DNONE      =
gui=3DNONE      ctermfg=3Dlightblue      ctermbg=3DNONE      =
cterm=3DNONE  "yield
hi rubyStringDelimiter         guifg=3D#336633      guibg=3DNONE      =
gui=3DNONE      ctermfg=3Dlightgreen     ctermbg=3DNONE      =
cterm=3DNONE
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

hi link rubyClass             Keyword=20
hi link rubyModule            Keyword=20
hi link rubyKeyword           Keyword=20
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type =20


" Special for Java
" hi link javaClassDecl    Type
hi link javaScopeDecl         Identifier=20
hi link javaCommentTitle      javaDocSeeTag=20
hi link javaDocTags           javaDocSeeTag=20
hi link javaDocParam          javaDocSeeTag=20
hi link javaDocSeeTagParam    javaDocSeeTag=20

hi javaDocSeeTag              guifg=3D#CCCCCC     guibg=3DNONE        =
gui=3DNONE      ctermfg=3Ddarkgray    ctermbg=3DNONE        cterm=3DNONE
hi javaDocSeeTag              guifg=3D#CCCCCC     guibg=3DNONE        =
gui=3DNONE      ctermfg=3Ddarkgray    ctermbg=3DNONE        cterm=3DNONE
"hi javaClassDecl              guifg=3D#CCFFCC     guibg=3DNONE        =
gui=3DNONE      ctermfg=3Dwhite       ctermbg=3DNONE        cterm=3DNONE


" Special for XML
hi link xmlTag          Keyword=20
hi link xmlTagName      Conditional=20
hi link xmlEndTag       Identifier=20


" Special for HTML
hi link htmlTag         Keyword=20
hi link htmlTagName     Conditional=20
hi link htmlEndTag      Identifier=20


" Special for Javascript
hi link javaScriptNumber      Number=20


" Special for Python
"hi  link pythonEscape         Keyword     =20


" Special for CSharp
hi  link csXmlTag             Keyword     =20


" Special for PHP
</PRE></BODY></HTML>
