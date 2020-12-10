"--------------------------------------------------------------------------------
"
"  Copyright (c) 2020 Chris Schilling <chris2schill@gmail.com>
"
"  http://github.com/chris2schill/vim-enum-to-string
"
"  Permission is hereby granted, free of charge, to any person obtaining a copy
"  of this software and associated documentation files (the "Software"), to
"  deal in the Software without restriction, including without limitation the
"  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
"  sell copies of the Software, and to permit persons to whom the Software is
"  furnished to do so, subject to the following conditions:
"
"  The above copyright notice and this permission notice shall be included in
"  all copies or substantial portions of the Software.
"
"  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
"  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
"  IN THE SOFTWARE.
"
"--------------------------------------------------------------------------------


if !exists('g:enum_to_string_is_template')
    let g:enum_to_string_is_template = 0
endif

if !exists('g:enum_to_string_template_string')
    let g:enum_to_string_template_string = 'template<>'
endif

if !exists('g:enum_to_string_function_name')
    let g:enum_to_string_function_name = 'enum_to_string'
endif

command! -range EnumToStringCreateCaseStatement :<line1>,<line2>normal! _icase weld$_wy$A: return ""hpA;==

function! s:GenTemplateString()
    if g:enum_to_string_is_template == 1
        exec ':normal! O'.g:enum_to_string_template_string.'j_'
    endif
endfunction

command! EnumToStringCreateFunctionBody exec ':normal! istd::string /enumdwi'.g:enum_to_string_function_name.' wy$"ay$hr(A e)/{oswitch(e){dd_/}O}'

function! s:GenEnumToString()
    let save_pos = getpos(".")
    call s:GenTemplateString()
    EnumToStringCreateFunctionBody
    normal! vi{:EnumToStringCreateCaseStatement oreturn "Compiler should not let you get here."A;
    call setpos(".", save_pos)
endfunction

command! EnumToString call s:GenEnumToString()
