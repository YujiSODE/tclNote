#tclNote
#tclNote_unicodeBlock.tcl
##===================================================================
#	Copyright (c) 2018 Yuji SODE <yuji.sode@gmail.com>
#
#	This software is released under the MIT License.
#	See LICENSE or http://opensource.org/licenses/mit-license.php
##===================================================================
#The block names and their ranges for tclNote
#These block names and their ranges are based on the Unicode Standard Version 10.0.0-11.0.0
#This program is compliant with the Unicode Standard.
##===================================================================
#Unicode is a registered trademark of Unicode, Inc. in the United States and other countries.
#Reference: Unicode, Inc. 1991-2018. the Unicode Consortium. derived on [2017-08-19 and 2018-08-01] and from: http://www.unicode.org/
#
#This program is compliant with the Unicode Standard.
#=== Templates ===
#	- for version: `set ::tclNote::unicodeVersion {versionText};`
#	  text description for version of the Unicode Standard in the namespace ::tclNote
#
#	- for Unicode block: `set ::tclNote::unicodeBlock(blockName) {x1,x2};`
#	  an array that has Unicode block ranges with their block name as index in the namespace ::tclNote
#	  the Unicode block ranges between x1 and x2
#
##=== version ===
set ::tclNote::unicodeVersion {10.0.0-11.0.0};
#=== the block names and their ranges ===
set ::tclNote::unicodeBlock(C0_Controls_and_Basic_Latin) {0,7f};
set ::tclNote::unicodeBlock(C1_Controls_and_Latin-1_Supplement) {80,ff};
set ::tclNote::unicodeBlock(Latin_Extended-A) {100,17f};
set ::tclNote::unicodeBlock(Latin_Extended-B) {180,24f};
set ::tclNote::unicodeBlock(IPA_Extensions) {250,2af};
set ::tclNote::unicodeBlock(Spacing_Modifier_Letters) {2b0,2ff};
set ::tclNote::unicodeBlock(Combining_Diacritical_Marks) {300,36f};
set ::tclNote::unicodeBlock(Greek_and_Coptic) {370,3ff};
set ::tclNote::unicodeBlock(Cyrillic) {400,4ff};
set ::tclNote::unicodeBlock(Cyrillic_Supplement) {500,52f};
set ::tclNote::unicodeBlock(Armenian) {530,58f};
set ::tclNote::unicodeBlock(Hebrew) {590,5ff};
set ::tclNote::unicodeBlock(Arabic) {600,6ff};
set ::tclNote::unicodeBlock(Syriac) {700,74f};
set ::tclNote::unicodeBlock(Arabic_Supplement) {750,77f};
set ::tclNote::unicodeBlock(Thaana) {780,7bf};
set ::tclNote::unicodeBlock(NKo) {7c0,7ff};
set ::tclNote::unicodeBlock(Samaritan) {800,83f};
set ::tclNote::unicodeBlock(Mandaic) {840,85f};
set ::tclNote::unicodeBlock(Syriac_Supplement) {860,86f};
set ::tclNote::unicodeBlock(Arabic_Extended-A) {8a0,8ff};
set ::tclNote::unicodeBlock(Devanagari) {900,97f};
set ::tclNote::unicodeBlock(Bengali) {980,9ff};
set ::tclNote::unicodeBlock(Gurmukhi) {a00,a7f};
set ::tclNote::unicodeBlock(Gujarati) {a80,aff};
set ::tclNote::unicodeBlock(Oriya) {b00,b7f};
set ::tclNote::unicodeBlock(Tamil) {b80,bff};
set ::tclNote::unicodeBlock(Telugu) {c00,c7f};
set ::tclNote::unicodeBlock(Kannada) {c80,cff};
set ::tclNote::unicodeBlock(Malayalam) {d00,d7f};
set ::tclNote::unicodeBlock(Sinhala) {d80,dff};
set ::tclNote::unicodeBlock(Thai) {e00,e7f};
set ::tclNote::unicodeBlock(Lao) {e80,eff};
set ::tclNote::unicodeBlock(Tibetan) {f00,fff};
set ::tclNote::unicodeBlock(Myanmar) {1000,109f};
set ::tclNote::unicodeBlock(Georgian) {10a0,10ff};
set ::tclNote::unicodeBlock(Hangul_Jamo) {1100,11ff};
set ::tclNote::unicodeBlock(Ethiopic) {1200,137f};
set ::tclNote::unicodeBlock(Ethiopic_Supplement) {1380,139f};
set ::tclNote::unicodeBlock(Cherokee) {13a0,13ff};
set ::tclNote::unicodeBlock(Unified_Canadian_Aboriginal_Syllabics) {1400,167f};
set ::tclNote::unicodeBlock(Ogham) {1680,169f};
set ::tclNote::unicodeBlock(Runic) {16a0,16ff};
set ::tclNote::unicodeBlock(Tagalog) {1700,171f};
set ::tclNote::unicodeBlock(Hanunoo) {1720,173f};
set ::tclNote::unicodeBlock(Buhid) {1740,175f};
set ::tclNote::unicodeBlock(Tagbanwa) {1760,177f};
set ::tclNote::unicodeBlock(Khmer) {1780,17ff};
set ::tclNote::unicodeBlock(Mongolian) {1800,18af};
set ::tclNote::unicodeBlock(Unified_Canadian_Aboriginal_Syllabics_Extended) {18b0,18ff};
set ::tclNote::unicodeBlock(Limbu) {1900,194f};
set ::tclNote::unicodeBlock(Tai_Le) {1950,197f};
set ::tclNote::unicodeBlock(New_Tai_Lue) {1980,19df};
set ::tclNote::unicodeBlock(Khmer_Symbols) {19e0,19ff};
set ::tclNote::unicodeBlock(Buginese) {1a00,1a1f};
set ::tclNote::unicodeBlock(Tai_Tham) {1a20,1aaf};
set ::tclNote::unicodeBlock(Combining_Diacritical_Marks_Extended) {1ab0,1aff};
set ::tclNote::unicodeBlock(Balinese) {1b00,1b7f};
set ::tclNote::unicodeBlock(Sundanese) {1b80,1bbf};
set ::tclNote::unicodeBlock(Batak) {1bc0,1bff};
set ::tclNote::unicodeBlock(Lepcha) {1c00,1c4f};
set ::tclNote::unicodeBlock(Ol_Chiki) {1c50,1c7f};
set ::tclNote::unicodeBlock(Cyrillic_Extended-C) {1c80,1c8f};
set ::tclNote::unicodeBlock(Sundanese_Supplement) {1cc0,1ccf};
set ::tclNote::unicodeBlock(Vedic_Extensions) {1cd0,1cff};
set ::tclNote::unicodeBlock(Phonetic_Extensions) {1d00,1d7f};
set ::tclNote::unicodeBlock(Phonetic_Extensions_Supplement) {1d80,1dbf};
set ::tclNote::unicodeBlock(Combining_Diacritical_Marks_Supplement) {1dc0,1dff};
set ::tclNote::unicodeBlock(Latin_Extended_Additional) {1e00,1eff};
set ::tclNote::unicodeBlock(Greek_Extended) {1f00,1fff};
set ::tclNote::unicodeBlock(General_Punctuation) {2000,206f};
set ::tclNote::unicodeBlock(Superscripts_and_Subscripts) {2070,209f};
set ::tclNote::unicodeBlock(Currency_Symbols) {20a0,20cf};
set ::tclNote::unicodeBlock(Combining_Diacritical_Marks_for_Symbols) {20d0,20ff};
set ::tclNote::unicodeBlock(Letterlike_Symbols) {2100,214f};
set ::tclNote::unicodeBlock(Number_Forms) {2150,218f};
set ::tclNote::unicodeBlock(Arrows) {2190,21ff};
set ::tclNote::unicodeBlock(Mathematical_Operators) {2200,22ff};
set ::tclNote::unicodeBlock(Miscellaneous_Technical) {2300,23ff};
set ::tclNote::unicodeBlock(Control_Pictures) {2400,243f};
set ::tclNote::unicodeBlock(Optical_Character_Recognition) {2440,245f};
set ::tclNote::unicodeBlock(Enclosed_Alphanumerics) {2460,24ff};
set ::tclNote::unicodeBlock(Box_Drawing) {2500,257f};
set ::tclNote::unicodeBlock(Block_Elements) {2580,259f};
set ::tclNote::unicodeBlock(Geometric_Shapes) {25a0,25ff};
set ::tclNote::unicodeBlock(Miscellaneous_Symbols) {2600,26ff};
set ::tclNote::unicodeBlock(Dingbats) {2700,27bf};
set ::tclNote::unicodeBlock(Miscellaneous_Mathematical_Symbols-A) {27c0,27ef};
set ::tclNote::unicodeBlock(Supplemental_Arrows-A) {27f0,27ff};
set ::tclNote::unicodeBlock(Braille_Patterns) {2800,28ff};
set ::tclNote::unicodeBlock(Supplemental_Arrows-B) {2900,297f};
set ::tclNote::unicodeBlock(Miscellaneous_Mathematical_Symbols-B) {2980,29ff};
set ::tclNote::unicodeBlock(Supplemental_Mathematical_Operators) {2a00,2aff};
set ::tclNote::unicodeBlock(Miscellaneous_Symbols_and_Arrows) {2b00,2bff};
set ::tclNote::unicodeBlock(Glagolitic) {2c00,2c5f};
set ::tclNote::unicodeBlock(Latin_Extended-C) {2c60,2c7f};
set ::tclNote::unicodeBlock(Coptic) {2c80,2cff};
set ::tclNote::unicodeBlock(Georgian_Supplement) {2d00,2d2f};
set ::tclNote::unicodeBlock(Tifinagh) {2d30,2d7f};
set ::tclNote::unicodeBlock(Ethiopic_Extended) {2d80,2ddf};
set ::tclNote::unicodeBlock(Cyrillic_Extended-A) {2de0,2dff};
set ::tclNote::unicodeBlock(Supplemental_Punctuation) {2e00,2e7f};
set ::tclNote::unicodeBlock(CJK_Radicals_Supplement) {2e80,2eff};
set ::tclNote::unicodeBlock(Kangxi_Radicals) {2f00,2fdf};
set ::tclNote::unicodeBlock(Ideographic_Description_Characters) {2ff0,2fff};
set ::tclNote::unicodeBlock(CJK_Symbols_and_Punctuation) {3000,303f};
set ::tclNote::unicodeBlock(Hiragana) {3040,309f};
set ::tclNote::unicodeBlock(Katakana) {30a0,30ff};
set ::tclNote::unicodeBlock(Bopomofo) {3100,312f};
set ::tclNote::unicodeBlock(Hangul_Compatibility_Jamo) {3130,318f};
set ::tclNote::unicodeBlock(Kanbun) {3190,319f};
set ::tclNote::unicodeBlock(Bopomofo_Extended) {31a0,31bf};
set ::tclNote::unicodeBlock(CJK_Strokes) {31c0,31ef};
set ::tclNote::unicodeBlock(Katakana_Phonetic_Extensions) {31f0,31ff};
set ::tclNote::unicodeBlock(Enclosed_CJK_Letters_and_Months) {3200,32ff};
set ::tclNote::unicodeBlock(CJK_Compatibility) {3300,33ff};
set ::tclNote::unicodeBlock(CJK_Unified_Ideographs_Extension_A) {3400,4db5};
set ::tclNote::unicodeBlock(Yijing_Hexagram_Symbols) {4dc0,4dff};
set ::tclNote::unicodeBlock(CJK_Unified_Ideographs) {4e00,9fef};
set ::tclNote::unicodeBlock(Yi_Syllables) {a000,a48f};
set ::tclNote::unicodeBlock(Yi_Radicals) {a490,a4cf};
set ::tclNote::unicodeBlock(Lisu) {a4d0,a4ff};
set ::tclNote::unicodeBlock(Vai) {a500,a63f};
set ::tclNote::unicodeBlock(Cyrillic_Extended-B) {a640,a69f};
set ::tclNote::unicodeBlock(Bamum) {a6a0,a6ff};
set ::tclNote::unicodeBlock(Modifier_Tone_Letters) {a700,a71f};
set ::tclNote::unicodeBlock(Latin_Extended-D) {a720,a7ff};
set ::tclNote::unicodeBlock(Syloti_Nagri) {a800,a82f};
set ::tclNote::unicodeBlock(Common_Indic_Number_Forms) {a830,a83f};
set ::tclNote::unicodeBlock(Phags-pa) {a840,a87f};
set ::tclNote::unicodeBlock(Saurashtra) {a880,a8df};
set ::tclNote::unicodeBlock(Devanagari_Extended) {a8e0,a8ff};
set ::tclNote::unicodeBlock(Kayah_Li) {a900,a92f};
set ::tclNote::unicodeBlock(Rejang) {a930,a95f};
set ::tclNote::unicodeBlock(Hangul_Jamo_Extended-A) {a960,a97f};
set ::tclNote::unicodeBlock(Javanese) {a980,a9df};
set ::tclNote::unicodeBlock(Myanmar_Extended-B) {a9e0,a9ff};
set ::tclNote::unicodeBlock(Cham) {aa00,aa5f};
set ::tclNote::unicodeBlock(Myanmar_Extended-A) {aa60,aa7f};
set ::tclNote::unicodeBlock(Tai_Viet) {aa80,aadf};
set ::tclNote::unicodeBlock(Meetei_Mayek_Extensions) {aae0,aaff};
set ::tclNote::unicodeBlock(Ethiopic_Extended-A) {ab00,ab2f};
set ::tclNote::unicodeBlock(Latin_Extended-E) {ab30,ab6f};
set ::tclNote::unicodeBlock(Cherokee_Supplement) {ab70,abbf};
set ::tclNote::unicodeBlock(Meetei_Mayek) {abc0,abff};
set ::tclNote::unicodeBlock(Hangul_Syllables) {ac00,d7a3};
set ::tclNote::unicodeBlock(Hangul_Jamo_Extended-B) {d7b0,d7ff};
set ::tclNote::unicodeBlock(High_Surrogates) {d800,db7f};
set ::tclNote::unicodeBlock(High_Private_Use_Surrogates) {db80,dbff};
set ::tclNote::unicodeBlock(Low_Surrogates) {dc00,dfff};
set ::tclNote::unicodeBlock(Private_Use_Area) {e000,f8ff};
set ::tclNote::unicodeBlock(CJK_Compatibility_Ideographs) {f900,faff};
set ::tclNote::unicodeBlock(Alphabetic_Presentation_Forms) {fb00,fb4f};
set ::tclNote::unicodeBlock(Arabic_Presentation_Forms-A) {fb50,fdff};
set ::tclNote::unicodeBlock(Variation_Selectors) {fe00,fe0f};
set ::tclNote::unicodeBlock(Vertical_Forms) {fe10,fe1f};
set ::tclNote::unicodeBlock(Combining_Half_Marks) {fe20,fe2f};
set ::tclNote::unicodeBlock(CJK_Compatibility_Forms) {fe30,fe4f};
set ::tclNote::unicodeBlock(Small_Form_Variants) {fe50,fe6f};
set ::tclNote::unicodeBlock(Arabic_Presentation_Forms-B) {fe70,feff};
set ::tclNote::unicodeBlock(Halfwidth_and_Fullwidth_Forms) {ff00,ffef};
set ::tclNote::unicodeBlock(Specials) {fff0,ffff};
set ::tclNote::unicodeBlock(Linear_B_Syllabary) {10000,1007f};
set ::tclNote::unicodeBlock(Linear_B_Ideograms) {10080,100ff};
set ::tclNote::unicodeBlock(Aegean_Numbers) {10100,1013f};
set ::tclNote::unicodeBlock(Ancient_Greek_Numbers) {10140,1018f};
set ::tclNote::unicodeBlock(Ancient_Symbols) {10190,101cf};
set ::tclNote::unicodeBlock(Phaistos_Disc) {101d0,101ff};
set ::tclNote::unicodeBlock(Lycian) {10280,1029f};
set ::tclNote::unicodeBlock(Carian) {102a0,102df};
set ::tclNote::unicodeBlock(Coptic_Epact_Numbers) {102e0,102ff};
set ::tclNote::unicodeBlock(Old_Italic) {10300,1032f};
set ::tclNote::unicodeBlock(Gothic) {10330,1034f};
set ::tclNote::unicodeBlock(Old_Permic) {10350,1037f};
set ::tclNote::unicodeBlock(Ugaritic) {10380,1039f};
set ::tclNote::unicodeBlock(Old_Persian) {103a0,103df};
set ::tclNote::unicodeBlock(Deseret) {10400,1044f};
set ::tclNote::unicodeBlock(Shavian) {10450,1047f};
set ::tclNote::unicodeBlock(Osmanya) {10480,104af};
set ::tclNote::unicodeBlock(Osage) {104b0,104ff};
set ::tclNote::unicodeBlock(Elbasan) {10500,1052f};
set ::tclNote::unicodeBlock(Caucasian_Albanian) {10530,1056f};
set ::tclNote::unicodeBlock(Linear_A) {10600,1077f};
set ::tclNote::unicodeBlock(Cypriot_Syllabary) {10800,1083f};
set ::tclNote::unicodeBlock(Imperial_Aramaic) {10840,1085f};
set ::tclNote::unicodeBlock(Palmyrene) {10860,1087f};
set ::tclNote::unicodeBlock(Nabataean) {10880,108af};
set ::tclNote::unicodeBlock(Hatran) {108e0,108ff};
set ::tclNote::unicodeBlock(Phoenician) {10900,1091f};
set ::tclNote::unicodeBlock(Lydian) {10920,1093f};
set ::tclNote::unicodeBlock(Meroitic_Hieroglyphs) {10980,1099f};
set ::tclNote::unicodeBlock(Meroitic_Cursive) {109a0,109ff};
set ::tclNote::unicodeBlock(Kharoshthi) {10a00,10a5f};
set ::tclNote::unicodeBlock(Old_South_Arabian) {10a60,10a7f};
set ::tclNote::unicodeBlock(Old_North_Arabian) {10a80,10a9f};
set ::tclNote::unicodeBlock(Manichaean) {10ac0,10aff};
set ::tclNote::unicodeBlock(Avestan) {10b00,10b3f};
set ::tclNote::unicodeBlock(Inscriptional_Parthian) {10b40,10b5f};
set ::tclNote::unicodeBlock(Inscriptional_Pahlavi) {10b60,10b7f};
set ::tclNote::unicodeBlock(Psalter_Pahlavi) {10b80,10baf};
set ::tclNote::unicodeBlock(Old_Turkic) {10c00,10c4f};
set ::tclNote::unicodeBlock(Old_Hungarian) {10c80,10cff};
set ::tclNote::unicodeBlock(Rumi_Numeral_Symbols) {10e60,10e7f};
set ::tclNote::unicodeBlock(Brahmi) {11000,1107f};
set ::tclNote::unicodeBlock(Kaithi) {11080,110cf};
set ::tclNote::unicodeBlock(Sora_Sompeng) {110d0,110ff};
set ::tclNote::unicodeBlock(Chakma) {11100,1114f};
set ::tclNote::unicodeBlock(Mahajani) {11150,1117f};
set ::tclNote::unicodeBlock(Sharada) {11180,111df};
set ::tclNote::unicodeBlock(Sinhala_Archaic_Numbers) {111e0,111ff};
set ::tclNote::unicodeBlock(Khojki) {11200,1124f};
set ::tclNote::unicodeBlock(Multani) {11280,112af};
set ::tclNote::unicodeBlock(Khudawadi) {112b0,112ff};
set ::tclNote::unicodeBlock(Grantha) {11300,1137f};
set ::tclNote::unicodeBlock(Newa) {11400,1147f};
set ::tclNote::unicodeBlock(Tirhuta) {11480,114df};
set ::tclNote::unicodeBlock(Siddham) {11580,115ff};
set ::tclNote::unicodeBlock(Modi) {11600,1165f};
set ::tclNote::unicodeBlock(Mongolian_Supplement) {11660,1167f};
set ::tclNote::unicodeBlock(Takri) {11680,116cf};
set ::tclNote::unicodeBlock(Ahom) {11700,1173f};
set ::tclNote::unicodeBlock(Warang_Citi) {118a0,118ff};
set ::tclNote::unicodeBlock(Zanabazar_Square) {11a00,11a4f};
set ::tclNote::unicodeBlock(Soyombo) {11a50,11aaf};
set ::tclNote::unicodeBlock(Pau_Cin_Hau) {11ac0,11aff};
set ::tclNote::unicodeBlock(Bhaiksuki) {11c00,11c6f};
set ::tclNote::unicodeBlock(Marchen) {11c70,11cbf};
set ::tclNote::unicodeBlock(Masaram_Gondi) {11d00,11d5f};
set ::tclNote::unicodeBlock(Cuneiform) {12000,123ff};
set ::tclNote::unicodeBlock(Cuneiform_Numbers_and_Punctuation) {12400,1247f};
set ::tclNote::unicodeBlock(Early_Dynastic_Cuneiform) {12480,1254f};
set ::tclNote::unicodeBlock(Egyptian_Hieroglyphs) {13000,1342f};
set ::tclNote::unicodeBlock(Anatolian_Hieroglyphs) {14400,1467f};
set ::tclNote::unicodeBlock(Bamum_Supplement) {16800,16a3f};
set ::tclNote::unicodeBlock(Mro) {16a40,16a6f};
set ::tclNote::unicodeBlock(Bassa_Vah) {16ad0,16aff};
set ::tclNote::unicodeBlock(Pahawh_Hmong) {16b00,16b8f};
set ::tclNote::unicodeBlock(Miao) {16f00,16f9f};
set ::tclNote::unicodeBlock(Ideographic_Symbols_and_Punctuation) {16fe0,16fff};
set ::tclNote::unicodeBlock(Tangut) {17000,187f1};
set ::tclNote::unicodeBlock(Tangut_Components) {18800,18aff};
set ::tclNote::unicodeBlock(Kana_Supplement) {1b000,1b0ff};
set ::tclNote::unicodeBlock(Kana_Extended-A) {1b100,1b12f};
set ::tclNote::unicodeBlock(Nushu) {1b170,1b2ff};
set ::tclNote::unicodeBlock(Duployan) {1bc00,1bc9f};
set ::tclNote::unicodeBlock(Shorthand_Format_Controls) {1bca0,1bcaf};
set ::tclNote::unicodeBlock(Byzantine_Musical_Symbols) {1d000,1d0ff};
set ::tclNote::unicodeBlock(Musical_Symbols) {1d100,1d1ff};
set ::tclNote::unicodeBlock(Ancient_Greek_Musical_Notation) {1d200,1d24f};
set ::tclNote::unicodeBlock(Tai_Xuan_Jing_Symbols) {1d300,1d35f};
set ::tclNote::unicodeBlock(Counting_Rod_Numerals) {1d360,1d37f};
set ::tclNote::unicodeBlock(Mathematical_Alphanumeric_Symbols) {1d400,1d7ff};
set ::tclNote::unicodeBlock(Sutton_SignWriting) {1d800,1daaf};
set ::tclNote::unicodeBlock(Glagolitic_Supplement) {1e000,1e02f};
set ::tclNote::unicodeBlock(Mende_Kikakui) {1e800,1e8df};
set ::tclNote::unicodeBlock(Adlam) {1e900,1e95f};
set ::tclNote::unicodeBlock(Arabic_Mathematical_Alphabetic_Symbols) {1ee00,1eeff};
set ::tclNote::unicodeBlock(Mahjong_Tiles) {1f000,1f02f};
set ::tclNote::unicodeBlock(Domino_Tiles) {1f030,1f09f};
set ::tclNote::unicodeBlock(Playing_Cards) {1f0a0,1f0ff};
set ::tclNote::unicodeBlock(Enclosed_Alphanumeric_Supplement) {1f100,1f1ff};
set ::tclNote::unicodeBlock(Enclosed_Ideographic_Supplement) {1f200,1f2ff};
set ::tclNote::unicodeBlock(Miscellaneous_Symbols_and_Pictographs) {1f300,1f5ff};
set ::tclNote::unicodeBlock(Emoticons) {1f600,1f64f};
set ::tclNote::unicodeBlock(Ornamental_Dingbats) {1f650,1f67f};
set ::tclNote::unicodeBlock(Transport_and_Map_Symbols) {1f680,1f6ff};
set ::tclNote::unicodeBlock(Alchemical_Symbols) {1f700,1f77f};
set ::tclNote::unicodeBlock(Geometric_Shapes_Extended) {1f780,1f7ff};
set ::tclNote::unicodeBlock(Supplemental_Arrows-C) {1f800,1f8ff};
set ::tclNote::unicodeBlock(Supplemental_Symbols_and_Pictographs) {1f900,1f9ff};
set ::tclNote::unicodeBlock(CJK_Unified_Ideographs_Extension_B) {20000,2a6d6};
set ::tclNote::unicodeBlock(CJK_Unified_Ideographs_Extension_C) {2a700,2b734};
set ::tclNote::unicodeBlock(CJK_Unified_Ideographs_Extension_D) {2b740,2b81d};
set ::tclNote::unicodeBlock(CJK_Unified_Ideographs_Extension_E) {2b820,2cea1};
set ::tclNote::unicodeBlock(CJK_Unified_Ideographs_Extension_F) {2ceb0,2ebe0};
set ::tclNote::unicodeBlock(CJK_Compatibility_Ideographs_Supplement) {2f800,2fa1f};
set ::tclNote::unicodeBlock(Tags) {e0000,e007f};
set ::tclNote::unicodeBlock(Variation_Selectors_Supplement) {e0100,e01ef};
set ::tclNote::unicodeBlock(Supplementary_Private_Use_Area-A) {fff80,fffff};
set ::tclNote::unicodeBlock(Supplementary_Private_Use_Area-B) {10ff80,10ffff};
set ::tclNote::unicodeBlock(Georgian_Extended) {1c90,1cbf};
set ::tclNote::unicodeBlock(Hanifi_Rohingya) {10d00,10d3f};
set ::tclNote::unicodeBlock(Old_Sogdian) {10f00,10f2f};
set ::tclNote::unicodeBlock(Sogdian) {10f30,10f6f};
set ::tclNote::unicodeBlock(Dogra) {11800,1184f};
set ::tclNote::unicodeBlock(Gunjala_Gondi) {11d60,11daf};
set ::tclNote::unicodeBlock(Makasar) {11ee0,11eff};
set ::tclNote::unicodeBlock(Medefaidrin) {16e40,16e9f};
set ::tclNote::unicodeBlock(Mayan_Numerals) {1d2e0,1d2ff};
set ::tclNote::unicodeBlock(Indic_Siyaq_Numbers) {1ec70,1ecbf};
set ::tclNote::unicodeBlock(Chess_Symbols) {1fa00,1fa6f};
##===================================================================
