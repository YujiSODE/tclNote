# Change Log

## [Unreleased] - 2018-09-30
## Changed
- [README.md] lines 38-40: `- [v2.0beta+]` `tclNote_unicodeBlockList.tcl`  
  `- [v2.0beta+]` `tclNote_unicodeBlock.tcl`
- [README.md] line 6: `>Copyright (c) 2017-2018 Yuji SODE \<yuji.sode@gmail.com\>  `
- [tclNote.tcl] line 156: `set unicHexRg $::tclNote::unicodeBlock([.uTable.cbBoxLbl.cbBox get]);`
- [tclNote.tcl] lines 152-153: `.uTable.cbBoxLbl.cbBox configure -values [lsort -dictionary [array names ::tclNote::unicodeBlock]];`  
  `.uTable.fontLbl.font configure -values $::tclNote::fonts;`

## Removed
- [tclNote.tcl] lines 120-126

## Changed
- [tclNote.tcl] lines 76-79: `# - $unicodeVersion: text description for version of the Unicode Standard`  
  `variable unicodeVersion;`  
  `# - $unicodeBlock: an array that has Unicode block ranges with their block name as index`  
  `variable unicodeBlock;`
- [tclNote.tcl] line 74: `# - $fonts: a list of available font families`
- [tclNote.tcl] lines 32-37:`# - $unicodeVersion: text description for version of the Unicode Standard`  
  `variable unicodeVersion {10.0.0-11.0.0};`  
  `# - $unicodeBlock: an array that has Unicode block ranges with their block name as index`  
  `variable unicodeBlock;array set unicodeBlock {};`  
  `#=== loading script for Unicode block list ===`  
  `source -encoding utf-8 ./tclNote_unicodeBlockList.tcl;`
- [tclNote.tcl] lines 29-30: `#=== variables ===`  
  `# - $fonts: a list of available font families`
- [tclNote.tcl] line 4: `#	Copyright (c) 2017-2018 Yuji SODE <yuji.sode@gmail.com>`
- [LICENSE] line 3: `Copyright (c) 2017-2018 Yuji Sode`

## Added
- [tclNote_unicodeBlockList.tcl]
- [tclNote_unicodeBlock.tcl]

## [1.3] - 2018-08-04
## Changed
- [tclNote.tcl] line 13: `#Reference: Unicode, Inc. 1991-2018. the Unicode Consortium. derived on [2017-08-19 and 2018-08-01] and from: http://www.unicode.org/`
- [README.md] line 43: `- Unicode, Inc. 1991-2018. the Unicode Consortium. derived on [2017-08-19 and 2018-08-01] and from: http://www.unicode.org/`
- [README.md] line 31: `- `Block`: Unicode block ranges based on the Unicode Standard Version 10.0.0-11.0.0.`

## [1.3] - 2018-08-02
## Changed
- [tclNote.tcl] line 166: `.uTable.hexTable insert end "\n#This table is based on the Unicode Standard Version 10.0.0-11.0.0.";`
- [tclNote.tcl] line 145: `.uTable.hexTable insert end "\n#This table is based on the Unicode Standard Version 10.0.0-11.0.0.";`

## Added
- [tclNote.tcl] line 126: `set unicodeBlock(Georgian_Extended) {1c90,1cbf};set unicodeBlock(Hanifi_Rohingya) {10d00,10d3f};set unicodeBlock(Old_Sogdian) {10f00,10f2f};set unicodeBlock(Sogdian) {10f30,10f6f};set unicodeBlock(Dogra) {11800,1184f};set unicodeBlock(Gunjala_Gondi) {11d60,11daf};set unicodeBlock(Makasar) {11ee0,11eff};set unicodeBlock(Medefaidrin) {16e40,16e9f};set unicodeBlock(Mayan_Numerals) {1d2e0,1d2ff};set unicodeBlock(Indic_Siyaq_Numbers) {1ec70,1ecbf};set unicodeBlock(Chess_Symbols) {1fa00,1fa6f};`
- [tclNote.tcl] line 125: `#the block names and their ranges (the Unicode Standard Version 11.0.0).`

## Fixed
- [tclNote.tcl] line 124: from `set unicodeBlock(Tangut) {17000,187ec};` to `set unicodeBlock(Tangut) {17000,187f1};`
- [tclNote.tcl] line 124: from `set unicodeBlock(CJK_Unified_Ideographs) {4e00,9fea};` to `set unicodeBlock(CJK_Unified_Ideographs) {4e00,9fef};`
- [tclNote.tcl] line 124: from `set unicodeBlock(Mathematical_Operators) {2220,22ff};` to `set unicodeBlock(Mathematical_Operators) {2200,22ff};`

## Changed
- [tclNote.tcl] line 123: `#the block names and their ranges are based on the Unicode Standard Version 10.0.0-11.0.0.`
- [tclNote.tcl] line 35: `#It returns Unicode character table in hexadecimals, based on the Unicode Standard Version 10.0.0-11.0.0.`
- [tclNote.tcl] line 13: `#Reference: Unicode, Inc. 1991-2017. the Unicode Consortium. derived on [2017-08-19 and 2018-08-01] and from: http://www.unicode.org/`

## [1.2] - 2017-10-10
## Changed
- [tclNote.tcl] line 50: `puts -nonewline $F $data;`
- [tclNote.tcl] line 43: `set X [read -nonewline [set F [open $fName r]]];`

## [1.1] - 2017-09-05
## Changed
- [tclNote.tcl] line 107: `set htmlTail "\n</p><footer>[clock format [clock seconds] -gmt 1]</footer></body></html>";`
