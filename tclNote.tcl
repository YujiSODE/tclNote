#tclNote
#tclNote.tcl
##===================================================================
#	Copyright (c) 2017 Yuji SODE <yuji.sode@gmail.com>
#
#	This software is released under the MIT License.
#	See LICENSE or http://opensource.org/licenses/mit-license.php
##===================================================================
#Unicode codepoints sequence friendly text editor.
#This program is compliant with the Unicode Standard.
#
#Unicode is a registered trademark of Unicode, Inc. in the United States and other countries.
#Reference: Unicode, Inc. 1991-2017. the Unicode Consortium. derived on [2017-08-19] and from: http://www.unicode.org/
#
#Unicode character table in this editor shows only character availability in the current environment.
#=== global values ===
# - $fPath: target file path
# - $uniSeq: csv formatted hexadecimal sequence as Unicode codepoints
# - $htmlPath: file path in order to html output
#== Unicode character table based on the Unicode Standard ==
# - $unicHexRg: csv formatted a range of Unicode codepoints
##===================================================================
set auto_noexec 1;
package require Tcl 8.6;
package require Tk 8.6;
wm title . "tclNote";
#=== namespace: tclNote ===
namespace eval ::tclNote {
	#$fonts: a list of available font families
	variable fonts [lsort -dictionary [font families]];
	#=== unicodeTcl_proc/unicodeTcl_proc.tcl (Yuji SODE,2017): the MIT License; https://gist.github.com/YujiSODE/688845db196c1c2edfe3dbb88b63478b ===
	#This function returns unicode string using given csv formatted hexadecimal numbers.
	proc getUnicode {codes} {set u [split $codes ,];set L {};foreach el $u {lappend L [subst "\\U$el"];};return [join $L {}];};
	#=== unicodeHexTable/unicodeHexTable.tcl (Yuji SODE,2017): the MIT License; https://gist.github.com/YujiSODE/c47df3cf12a6448c8097628951ace4d4 ===
	#It returns Unicode character table in hexadecimals, based on the Unicode Standard Version 10.0.0.
	proc getHexTable {hex {hex0 0}} {set table {};set v0_1 [subst "0x$hex0"];set v0_2 [subst "0x$hex"];set v1 [expr {$v0_1>$v0_2?$v0_2:$v0_1}];set v2 [expr {$v0_1>$v0_2?$v0_1:$v0_2}];while {$v1<[expr {$v2+1}]} {set h [format %x $v1];lappend table "U+$h:\[[subst "\\U$h"]\]";incr v1 1;};return $table;};
	#=== file I/O functions ===
	#== Parameters ==
 	# - fName: name of a text file or its path
	# - data: string data to output
	#file input
	proc fRead {fName} {
		set X [read [set F [open $fName r]]];
		close $F;
		return $X;
	};
	#file output; it overrides the file: fName.
	proc fWrite {fName data} {
		set F [open $fName w];
		puts $F $data;
		close $F;
	};
	#=== Unicode table ===
	#== Parameters ==
	# - v1 and v2: hexadecimal numbers without prefix "0x"
	#Function that returns a table
	proc createTable {v1 v2} {
		set V [::tclNote::getHexTable $v1 $v2];set R {};set i 0;
		foreach x $V {
			lappend R " $x[expr $i<15?{}:{\n}]";
			set i [expr {$i<15?$i+1:0}];
		}
		return [join $R {}];
	};
	#=== it runs "tclNote" ===
	proc run {} {
		#$fonts: a list of available font families
		variable fonts;
		#****** (1) file I/O ******
		grid [ttk::frame .fileIO -width 10 -height 2 -borderwidth 1 -relief solid] -column 0 -row 0 -sticky ew;
			grid [ttk::label .fileIO.lbl -text {File path:}] -column 0 -row 0;
			grid [ttk::entry .fileIO.filePath -width 10 -textvariable fPath] -column 1 -row 0;
			grid [ttk::button .fileIO.loadB -text {Open file}] -column 2 -row 0 -padx 5 -pady 2;
			grid [ttk::button .fileIO.saveB -text {Output/Override}] -column 3 -row 0 -padx 5 -pady 2;
			grid [ttk::button .fileIO.saveHtml -text {Output as html}] -column 3 -row 1 -padx 5 -pady 2;
		#****** (2) textarea ******
		grid [tk::text .txtA -width 40 -height 10 -wrap none] -column 0 -row 1 -sticky nw;
		#** Font to display **
		grid [tk::labelframe .fontLbl -text {Font}] -column 1 -row 1 -sticky ns;
			grid [ttk::combobox .fontLbl.font -state readonly -width 20];
			.fontLbl.font configure -values $fonts;
		#****** (3) Unicode codepoints sequence input ******
		grid [ttk::frame .unicodeSeq -width 10 -height 1 -borderwidth 1 -relief solid] -column 0 -row 2 -sticky ew;
			grid [ttk::label .unicodeSeq.lbl -text {Unicode codepoints:}] -column 0 -row 0;
			#$uniSeq: csv formatted hexadecimal sequence as Unicode codepoints
			grid [ttk::entry .unicodeSeq.seq -textvariable uniSeq] -column 1 -row 0;
			grid [ttk::button .unicodeSeq.insertB -text {Insert Unicode characters}] -column 1 -row 1 -padx 5 -pady 2;
			#** Unicode character table **
			#This Unicode character table shows only character availability in the current environment
			grid [ttk::button .unicodeSeq.tableB -text {Unicode table}] -column 0 -row 1 -padx 5 -pady 2;
		#****** Events ******
			#[Event]: loading file
			.fileIO.loadB configure -command {
				.txtA delete 1.0 end;
				.txtA insert 1.0 [::tclNote::fRead $fPath];
			};
			#[Event]: outputting text
			.fileIO.saveB configure -command {::tclNote::fWrite $fPath [.txtA get 1.0 end];};
			#[Event]: outputting as html
			.fileIO.saveHtml configure -command {
				#$htmlPath: file path in order to html output
				regsub {\.[a-zA-Z0-9_]+$} $fPath {} htmlPath;
				set htmlPath "$htmlPath.html";
				#CSS
				set cssFont [expr {[llength [.fontLbl.font get]]?"<style type=\"text/css\">\n\#pMain\{font-family:\"[.fontLbl.font get]\",monospace\;\}\n</style>":{}}];
				set htmlHead "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"utf-8\"><meta name=\"generator\" content=\"tclNote\"><title>tclNote_html</title>$cssFont</head><body><p id=\"pMain\">\n";
				set htmlTail "\n</p><footer>[clock format [clock seconds]]</footer></body></html>";
				::tclNote::fWrite $htmlPath "$htmlHead[regsub -all {\n} [.txtA get 1.0 end] {<br>}]$htmlTail";
			};
			#[Event]: inserting Unicode characters
			.unicodeSeq.insertB configure -command {.txtA insert end [::tclNote::getUnicode $uniSeq];};
			#[Event]: font change
			bind .fontLbl.font <<ComboboxSelected>> {
				.txtA configure -font [list [.fontLbl.font get] 10];
			};
			#[Event]: Unicode table based on the Unicode Standard
			.unicodeSeq.tableB configure -command {
				tk::toplevel .uTable;
				wm title .uTable {Unicode character table};
				#$fonts: a list of available font families
				set fonts [lsort -dictionary [font families]];
				#$unicodeBlock: an array that has Unicode block ranges with their block name as index
				#the block names and their ranges are based on the Unicode Standard Version 10.0.0.
				set unicodeBlock(C0_Controls_and_Basic_Latin) {0,7f};set unicodeBlock(C1_Controls_and_Latin-1_Supplement) {80,ff};set unicodeBlock(Latin_Extended-A) {100,17f};set unicodeBlock(Latin_Extended-B) {180,24f};set unicodeBlock(IPA_Extensions) {250,2af};set unicodeBlock(Spacing_Modifier_Letters) {2b0,2ff};set unicodeBlock(Combining_Diacritical_Marks) {300,36f};set unicodeBlock(Greek_and_Coptic) {370,3ff};set unicodeBlock(Cyrillic) {400,4ff};set unicodeBlock(Cyrillic_Supplement) {500,52f};set unicodeBlock(Armenian) {530,58f};set unicodeBlock(Hebrew) {590,5ff};set unicodeBlock(Arabic) {600,6ff};set unicodeBlock(Syriac) {700,74f};set unicodeBlock(Arabic_Supplement) {750,77f};set unicodeBlock(Thaana) {780,7bf};set unicodeBlock(NKo) {7c0,7ff};set unicodeBlock(Samaritan) {800,83f};set unicodeBlock(Mandaic) {840,85f};set unicodeBlock(Syriac_Supplement) {860,86f};set unicodeBlock(Arabic_Extended-A) {8a0,8ff};set unicodeBlock(Devanagari) {900,97f};set unicodeBlock(Bengali) {980,9ff};set unicodeBlock(Gurmukhi) {a00,a7f};set unicodeBlock(Gujarati) {a80,aff};set unicodeBlock(Oriya) {b00,b7f};set unicodeBlock(Tamil) {b80,bff};set unicodeBlock(Telugu) {c00,c7f};set unicodeBlock(Kannada) {c80,cff};set unicodeBlock(Malayalam) {d00,d7f};set unicodeBlock(Sinhala) {d80,dff};set unicodeBlock(Thai) {e00,e7f};set unicodeBlock(Lao) {e80,eff};set unicodeBlock(Tibetan) {f00,fff};set unicodeBlock(Myanmar) {1000,109f};set unicodeBlock(Georgian) {10a0,10ff};set unicodeBlock(Hangul_Jamo) {1100,11ff};set unicodeBlock(Ethiopic) {1200,137f};set unicodeBlock(Ethiopic_Supplement) {1380,139f};set unicodeBlock(Cherokee) {13a0,13ff};set unicodeBlock(Unified_Canadian_Aboriginal_Syllabics) {1400,167f};set unicodeBlock(Ogham) {1680,169f};set unicodeBlock(Runic) {16a0,16ff};set unicodeBlock(Tagalog) {1700,171f};set unicodeBlock(Hanunoo) {1720,173f};set unicodeBlock(Buhid) {1740,175f};set unicodeBlock(Tagbanwa) {1760,177f};set unicodeBlock(Khmer) {1780,17ff};set unicodeBlock(Mongolian) {1800,18af};set unicodeBlock(Unified_Canadian_Aboriginal_Syllabics_Extended) {18b0,18ff};set unicodeBlock(Limbu) {1900,194f};set unicodeBlock(Tai_Le) {1950,197f};set unicodeBlock(New_Tai_Lue) {1980,19df};set unicodeBlock(Khmer_Symbols) {19e0,19ff};set unicodeBlock(Buginese) {1a00,1a1f};set unicodeBlock(Tai_Tham) {1a20,1aaf};set unicodeBlock(Combining_Diacritical_Marks_Extended) {1ab0,1aff};set unicodeBlock(Balinese) {1b00,1b7f};set unicodeBlock(Sundanese) {1b80,1bbf};set unicodeBlock(Batak) {1bc0,1bff};set unicodeBlock(Lepcha) {1c00,1c4f};set unicodeBlock(Ol_Chiki) {1c50,1c7f};set unicodeBlock(Cyrillic_Extended-C) {1c80,1c8f};set unicodeBlock(Sundanese_Supplement) {1cc0,1ccf};set unicodeBlock(Vedic_Extensions) {1cd0,1cff};set unicodeBlock(Phonetic_Extensions) {1d00,1d7f};set unicodeBlock(Phonetic_Extensions_Supplement) {1d80,1dbf};set unicodeBlock(Combining_Diacritical_Marks_Supplement) {1dc0,1dff};set unicodeBlock(Latin_Extended_Additional) {1e00,1eff};set unicodeBlock(Greek_Extended) {1f00,1fff};set unicodeBlock(General_Punctuation) {2000,206f};set unicodeBlock(Superscripts_and_Subscripts) {2070,209f};set unicodeBlock(Currency_Symbols) {20a0,20cf};set unicodeBlock(Combining_Diacritical_Marks_for_Symbols) {20d0,20ff};set unicodeBlock(Letterlike_Symbols) {2100,214f};set unicodeBlock(Number_Forms) {2150,218f};set unicodeBlock(Arrows) {2190,21ff};set unicodeBlock(Mathematical_Operators) {2220,22ff};set unicodeBlock(Miscellaneous_Technical) {2300,23ff};set unicodeBlock(Control_Pictures) {2400,243f};set unicodeBlock(Optical_Character_Recognition) {2440,245f};set unicodeBlock(Enclosed_Alphanumerics) {2460,24ff};set unicodeBlock(Box_Drawing) {2500,257f};set unicodeBlock(Block_Elements) {2580,259f};set unicodeBlock(Geometric_Shapes) {25a0,25ff};set unicodeBlock(Miscellaneous_Symbols) {2600,26ff};set unicodeBlock(Dingbats) {2700,27bf};set unicodeBlock(Miscellaneous_Mathematical_Symbols-A) {27c0,27ef};set unicodeBlock(Supplemental_Arrows-A) {27f0,27ff};set unicodeBlock(Braille_Patterns) {2800,28ff};set unicodeBlock(Supplemental_Arrows-B) {2900,297f};set unicodeBlock(Miscellaneous_Mathematical_Symbols-B) {2980,29ff};set unicodeBlock(Supplemental_Mathematical_Operators) {2a00,2aff};set unicodeBlock(Miscellaneous_Symbols_and_Arrows) {2b00,2bff};set unicodeBlock(Glagolitic) {2c00,2c5f};set unicodeBlock(Latin_Extended-C) {2c60,2c7f};set unicodeBlock(Coptic) {2c80,2cff};set unicodeBlock(Georgian_Supplement) {2d00,2d2f};set unicodeBlock(Tifinagh) {2d30,2d7f};set unicodeBlock(Ethiopic_Extended) {2d80,2ddf};set unicodeBlock(Cyrillic_Extended-A) {2de0,2dff};set unicodeBlock(Supplemental_Punctuation) {2e00,2e7f};set unicodeBlock(CJK_Radicals_Supplement) {2e80,2eff};set unicodeBlock(Kangxi_Radicals) {2f00,2fdf};set unicodeBlock(Ideographic_Description_Characters) {2ff0,2fff};set unicodeBlock(CJK_Symbols_and_Punctuation) {3000,303f};set unicodeBlock(Hiragana) {3040,309f};set unicodeBlock(Katakana) {30a0,30ff};set unicodeBlock(Bopomofo) {3100,312f};set unicodeBlock(Hangul_Compatibility_Jamo) {3130,318f};set unicodeBlock(Kanbun) {3190,319f};set unicodeBlock(Bopomofo_Extended) {31a0,31bf};set unicodeBlock(CJK_Strokes) {31c0,31ef};set unicodeBlock(Katakana_Phonetic_Extensions) {31f0,31ff};set unicodeBlock(Enclosed_CJK_Letters_and_Months) {3200,32ff};set unicodeBlock(CJK_Compatibility) {3300,33ff};set unicodeBlock(CJK_Unified_Ideographs_Extension_A) {3400,4db5};set unicodeBlock(Yijing_Hexagram_Symbols) {4dc0,4dff};set unicodeBlock(CJK_Unified_Ideographs) {4e00,9fea};set unicodeBlock(Yi_Syllables) {a000,a48f};set unicodeBlock(Yi_Radicals) {a490,a4cf};set unicodeBlock(Lisu) {a4d0,a4ff};set unicodeBlock(Vai) {a500,a63f};set unicodeBlock(Cyrillic_Extended-B) {a640,a69f};set unicodeBlock(Bamum) {a6a0,a6ff};set unicodeBlock(Modifier_Tone_Letters) {a700,a71f};set unicodeBlock(Latin_Extended-D) {a720,a7ff};set unicodeBlock(Syloti_Nagri) {a800,a82f};set unicodeBlock(Common_Indic_Number_Forms) {a830,a83f};set unicodeBlock(Phags-pa) {a840,a87f};set unicodeBlock(Saurashtra) {a880,a8df};set unicodeBlock(Devanagari_Extended) {a8e0,a8ff};set unicodeBlock(Kayah_Li) {a900,a92f};set unicodeBlock(Rejang) {a930,a95f};set unicodeBlock(Hangul_Jamo_Extended-A) {a960,a97f};set unicodeBlock(Javanese) {a980,a9df};set unicodeBlock(Myanmar_Extended-B) {a9e0,a9ff};set unicodeBlock(Cham) {aa00,aa5f};set unicodeBlock(Myanmar_Extended-A) {aa60,aa7f};set unicodeBlock(Tai_Viet) {aa80,aadf};set unicodeBlock(Meetei_Mayek_Extensions) {aae0,aaff};set unicodeBlock(Ethiopic_Extended-A) {ab00,ab2f};set unicodeBlock(Latin_Extended-E) {ab30,ab6f};set unicodeBlock(Cherokee_Supplement) {ab70,abbf};set unicodeBlock(Meetei_Mayek) {abc0,abff};set unicodeBlock(Hangul_Syllables) {ac00,d7a3};set unicodeBlock(Hangul_Jamo_Extended-B) {d7b0,d7ff};set unicodeBlock(High_Surrogates) {d800,db7f};set unicodeBlock(High_Private_Use_Surrogates) {db80,dbff};set unicodeBlock(Low_Surrogates) {dc00,dfff};set unicodeBlock(Private_Use_Area) {e000,f8ff};set unicodeBlock(CJK_Compatibility_Ideographs) {f900,faff};set unicodeBlock(Alphabetic_Presentation_Forms) {fb00,fb4f};set unicodeBlock(Arabic_Presentation_Forms-A) {fb50,fdff};set unicodeBlock(Variation_Selectors) {fe00,fe0f};set unicodeBlock(Vertical_Forms) {fe10,fe1f};set unicodeBlock(Combining_Half_Marks) {fe20,fe2f};set unicodeBlock(CJK_Compatibility_Forms) {fe30,fe4f};set unicodeBlock(Small_Form_Variants) {fe50,fe6f};set unicodeBlock(Arabic_Presentation_Forms-B) {fe70,feff};set unicodeBlock(Halfwidth_and_Fullwidth_Forms) {ff00,ffef};set unicodeBlock(Specials) {fff0,ffff};set unicodeBlock(Linear_B_Syllabary) {10000,1007f};set unicodeBlock(Linear_B_Ideograms) {10080,100ff};set unicodeBlock(Aegean_Numbers) {10100,1013f};set unicodeBlock(Ancient_Greek_Numbers) {10140,1018f};set unicodeBlock(Ancient_Symbols) {10190,101cf};set unicodeBlock(Phaistos_Disc) {101d0,101ff};set unicodeBlock(Lycian) {10280,1029f};set unicodeBlock(Carian) {102a0,102df};set unicodeBlock(Coptic_Epact_Numbers) {102e0,102ff};set unicodeBlock(Old_Italic) {10300,1032f};set unicodeBlock(Gothic) {10330,1034f};set unicodeBlock(Old_Permic) {10350,1037f};set unicodeBlock(Ugaritic) {10380,1039f};set unicodeBlock(Old_Persian) {103a0,103df};set unicodeBlock(Deseret) {10400,1044f};set unicodeBlock(Shavian) {10450,1047f};set unicodeBlock(Osmanya) {10480,104af};set unicodeBlock(Osage) {104b0,104ff};set unicodeBlock(Elbasan) {10500,1052f};set unicodeBlock(Caucasian_Albanian) {10530,1056f};set unicodeBlock(Linear_A) {10600,1077f};set unicodeBlock(Cypriot_Syllabary) {10800,1083f};set unicodeBlock(Imperial_Aramaic) {10840,1085f};set unicodeBlock(Palmyrene) {10860,1087f};set unicodeBlock(Nabataean) {10880,108af};set unicodeBlock(Hatran) {108e0,108ff};set unicodeBlock(Phoenician) {10900,1091f};set unicodeBlock(Lydian) {10920,1093f};set unicodeBlock(Meroitic_Hieroglyphs) {10980,1099f};set unicodeBlock(Meroitic_Cursive) {109a0,109ff};set unicodeBlock(Kharoshthi) {10a00,10a5f};set unicodeBlock(Old_South_Arabian) {10a60,10a7f};set unicodeBlock(Old_North_Arabian) {10a80,10a9f};set unicodeBlock(Manichaean) {10ac0,10aff};set unicodeBlock(Avestan) {10b00,10b3f};set unicodeBlock(Inscriptional_Parthian) {10b40,10b5f};set unicodeBlock(Inscriptional_Pahlavi) {10b60,10b7f};set unicodeBlock(Psalter_Pahlavi) {10b80,10baf};set unicodeBlock(Old_Turkic) {10c00,10c4f};set unicodeBlock(Old_Hungarian) {10c80,10cff};set unicodeBlock(Rumi_Numeral_Symbols) {10e60,10e7f};set unicodeBlock(Brahmi) {11000,1107f};set unicodeBlock(Kaithi) {11080,110cf};set unicodeBlock(Sora_Sompeng) {110d0,110ff};set unicodeBlock(Chakma) {11100,1114f};set unicodeBlock(Mahajani) {11150,1117f};set unicodeBlock(Sharada) {11180,111df};set unicodeBlock(Sinhala_Archaic_Numbers) {111e0,111ff};set unicodeBlock(Khojki) {11200,1124f};set unicodeBlock(Multani) {11280,112af};set unicodeBlock(Khudawadi) {112b0,112ff};set unicodeBlock(Grantha) {11300,1137f};set unicodeBlock(Newa) {11400,1147f};set unicodeBlock(Tirhuta) {11480,114df};set unicodeBlock(Siddham) {11580,115ff};set unicodeBlock(Modi) {11600,1165f};set unicodeBlock(Mongolian_Supplement) {11660,1167f};set unicodeBlock(Takri) {11680,116cf};set unicodeBlock(Ahom) {11700,1173f};set unicodeBlock(Warang_Citi) {118a0,118ff};set unicodeBlock(Zanabazar_Square) {11a00,11a4f};set unicodeBlock(Soyombo) {11a50,11aaf};set unicodeBlock(Pau_Cin_Hau) {11ac0,11aff};set unicodeBlock(Bhaiksuki) {11c00,11c6f};set unicodeBlock(Marchen) {11c70,11cbf};set unicodeBlock(Masaram_Gondi) {11d00,11d5f};set unicodeBlock(Cuneiform) {12000,123ff};set unicodeBlock(Cuneiform_Numbers_and_Punctuation) {12400,1247f};set unicodeBlock(Early_Dynastic_Cuneiform) {12480,1254f};set unicodeBlock(Egyptian_Hieroglyphs) {13000,1342f};set unicodeBlock(Anatolian_Hieroglyphs) {14400,1467f};set unicodeBlock(Bamum_Supplement) {16800,16a3f};set unicodeBlock(Mro) {16a40,16a6f};set unicodeBlock(Bassa_Vah) {16ad0,16aff};set unicodeBlock(Pahawh_Hmong) {16b00,16b8f};set unicodeBlock(Miao) {16f00,16f9f};set unicodeBlock(Ideographic_Symbols_and_Punctuation) {16fe0,16fff};set unicodeBlock(Tangut) {17000,187ec};set unicodeBlock(Tangut_Components) {18800,18aff};set unicodeBlock(Kana_Supplement) {1b000,1b0ff};set unicodeBlock(Kana_Extended-A) {1b100,1b12f};set unicodeBlock(Nushu) {1b170,1b2ff};set unicodeBlock(Duployan) {1bc00,1bc9f};set unicodeBlock(Shorthand_Format_Controls) {1bca0,1bcaf};set unicodeBlock(Byzantine_Musical_Symbols) {1d000,1d0ff};set unicodeBlock(Musical_Symbols) {1d100,1d1ff};set unicodeBlock(Ancient_Greek_Musical_Notation) {1d200,1d24f};set unicodeBlock(Tai_Xuan_Jing_Symbols) {1d300,1d35f};set unicodeBlock(Counting_Rod_Numerals) {1d360,1d37f};set unicodeBlock(Mathematical_Alphanumeric_Symbols) {1d400,1d7ff};set unicodeBlock(Sutton_SignWriting) {1d800,1daaf};set unicodeBlock(Glagolitic_Supplement) {1e000,1e02f};set unicodeBlock(Mende_Kikakui) {1e800,1e8df};set unicodeBlock(Adlam) {1e900,1e95f};set unicodeBlock(Arabic_Mathematical_Alphabetic_Symbols) {1ee00,1eeff};set unicodeBlock(Mahjong_Tiles) {1f000,1f02f};set unicodeBlock(Domino_Tiles) {1f030,1f09f};set unicodeBlock(Playing_Cards) {1f0a0,1f0ff};set unicodeBlock(Enclosed_Alphanumeric_Supplement) {1f100,1f1ff};set unicodeBlock(Enclosed_Ideographic_Supplement) {1f200,1f2ff};set unicodeBlock(Miscellaneous_Symbols_and_Pictographs) {1f300,1f5ff};set unicodeBlock(Emoticons) {1f600,1f64f};set unicodeBlock(Ornamental_Dingbats) {1f650,1f67f};set unicodeBlock(Transport_and_Map_Symbols) {1f680,1f6ff};set unicodeBlock(Alchemical_Symbols) {1f700,1f77f};set unicodeBlock(Geometric_Shapes_Extended) {1f780,1f7ff};set unicodeBlock(Supplemental_Arrows-C) {1f800,1f8ff};set unicodeBlock(Supplemental_Symbols_and_Pictographs) {1f900,1f9ff};set unicodeBlock(CJK_Unified_Ideographs_Extension_B) {20000,2a6d6};set unicodeBlock(CJK_Unified_Ideographs_Extension_C) {2a700,2b734};set unicodeBlock(CJK_Unified_Ideographs_Extension_D) {2b740,2b81d};set unicodeBlock(CJK_Unified_Ideographs_Extension_E) {2b820,2cea1};set unicodeBlock(CJK_Unified_Ideographs_Extension_F) {2ceb0,2ebe0};set unicodeBlock(CJK_Compatibility_Ideographs_Supplement) {2f800,2fa1f};set unicodeBlock(Tags) {e0000,e007f};set unicodeBlock(Variation_Selectors_Supplement) {e0100,e01ef};set unicodeBlock(Supplementary_Private_Use_Area-A) {fff80,fffff};set unicodeBlock(Supplementary_Private_Use_Area-B) {10ff80,10ffff};
				#Table contents
				grid [ttk::frame .uTable.iOFr -borderwidth 1 -relief solid] -column 0 -row 0 -sticky ew;
					grid [ttk::label .uTable.iOFr.lbl -text {Unicode codepoints range:}] -column 0 -row 0;
					#$unicHexRg: csv formatted a range of Unicode codepoints
					grid [ttk::entry .uTable.iOFr.input -textvariable unicHexRg] -column 1 -row 0;
					grid [ttk::button .uTable.iOFr.b -text {Get Unicode Table}] -column 2 -row 0 -padx 5 -pady 2;
				#** Unicode character table **
				grid [tk::text .uTable.hexTable -width 100 -height 10 -wrap word] -column 0 -row 1 -sticky nw;
				#** Unicode block **
				grid [ttk::labelframe .uTable.cbBoxLbl -text {Unicode Block}] -column 3 -row 0 -sticky nw;
					grid [ttk::combobox .uTable.cbBoxLbl.cbBox -state readonly -width 30];
				#** Font to display **
				grid [tk::labelframe .uTable.fontLbl -text {Font}] -column 3 -row 1 -sticky nw;
					grid [ttk::combobox .uTable.fontLbl.font -state readonly -width 20];
				#** default value for the table **
				set unicHexRg {0,100};
				.uTable.hexTable insert 1.0 {Unicode Character Table};
				.uTable.hexTable insert end "\n\n#=== This table shows only character availability in the current environment ===";
				.uTable.hexTable insert end "\n#This table is based on the Unicode Standard Version 10.0.0.";
				.uTable.hexTable insert end "\n#Unicode is a registered trademark of Unicode, Inc. in the United States and other countries.";
				.uTable.hexTable insert end "\n#the Unicode Consortium: http:\/\/www.unicode.org\/";
					.uTable.cbBoxLbl.cbBox configure -values [lsort -dictionary [array names unicodeBlock]];
					.uTable.fontLbl.font configure -values $fonts;
				#[Event]: Unicode table; Unicode block change
				bind .uTable.cbBoxLbl.cbBox <<ComboboxSelected>> {
					set unicHexRg $unicodeBlock([.uTable.cbBoxLbl.cbBox get]);
				};
				#[Event]: Unicode table; font change
				bind .uTable.fontLbl.font <<ComboboxSelected>> {
					.uTable.hexTable configure -font [list [.uTable.fontLbl.font get] 10];
				};
				#[Event]: Unicode table; table event
				.uTable.iOFr.b configure -command {
					if {[info exists unicHexRg]} {
						set x [split $unicHexRg ,];
						if {[llength [lindex $x 0]]>0&&[llength [lindex $x 1]]>0} {
							.uTable.hexTable delete 1.0 end;
							.uTable.hexTable insert 1.0 [::tclNote::createTable [lindex $x 0] [lindex $x 1]];
							.uTable.hexTable insert end "\n\n#=== This table shows only character availability in the current environment ===";
							.uTable.hexTable insert end "\n#This table is based on the Unicode Standard Version 10.0.0.";
							.uTable.hexTable insert end "\n#Unicode is a registered trademark of Unicode, Inc. in the United States and other countries.";
							.uTable.hexTable insert end "\n#the Unicode Consortium: http:\/\/www.unicode.org\/";
						};
					};
				};
			};
		return "\"tclNote\" on Tcl [info tclversion]";
	};
};
::tclNote::run;
