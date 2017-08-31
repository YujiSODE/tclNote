# tclNote
Unicode codepoints sequence friendly text editor.  
https://github.com/YujiSODE/tclNote  
This program is compliant with the Unicode Standard.  
Unicode character table in this editor shows only character availability in the current environment.
>Copyright (c) 2017 Yuji SODE \<yuji.sode@gmail.com\>  
>This software is released under the MIT License.  
>See LICENSE or http://opensource.org/licenses/mit-license.php

**Unicode is a registered trademark of Unicode, Inc. in the United States and other countries.**
- Unicode characters input by hexadecimal sequence
- HTML output
- Character table
______
![Screenshot of tclNote v0.5](https://user-images.githubusercontent.com/19919184/29911030-54730f72-8e67-11e7-8582-f86cc1a47853.png)  
**Figure 1. Screenshot of tclNote v0.5.**  
![Screenshot of Screenshot of Unicode character table in tclNote v0.5](https://user-images.githubusercontent.com/19919184/29911378-a0a9ba20-8e68-11e7-98e7-21ebc9e9c6b4.png)  
**Figure 2. Screenshot of Unicode character table.**  
Unicode character table in this editor shows only character availability in the current environment.

## Interfaces
- `File path`: file path to read or write
- `Unicode codepoints`: csv formatted hexadecimal sequence as Unicode codepoints
- `Insert Unicode characters`: it inserts Unicode characters defined at above `Unicode codepoints`
- `Unicode table`: it shows Unicode character table

**Unicode character table**

- `Unicode codepoints range`: csv formatted hexadecimal sequence as a range of Unicode codepoints
- `Get Unicode Table`: show Unicode table defined at above `Unicode codepoints range`
- `Block`: Unicode block ranges based on the Unicode Standard Version 10.0.0.

## Script
It requires Tcl/Tk.
- `tclNote.tcl`

## Library list
- unicodeTcl_proc/unicodeTcl_proc.tcl (Yuji SODE,2017): the MIT License; https://gist.github.com/YujiSODE/688845db196c1c2edfe3dbb88b63478b
- unicodeHexTable/unicodeHexTable.tcl (Yuji SODE,2017): the MIT License; https://gist.github.com/YujiSODE/c47df3cf12a6448c8097628951ace4d4

## Reference
- Unicode, Inc. 1991-2017. the Unicode Consortium. derived on [2017-08-19] and from: http://www.unicode.org/
