#tclNote
#tclNote.tcl
##===================================================================
#	Copyright (c) 2017 Yuji SODE <yuji.sode@gmail.com>
#
#	This software is released under the MIT License.
#	See LICENSE or http://opensource.org/licenses/mit-license.php
##===================================================================
#Unicode codepoints sequence friendly text editor.
#This program is compliant with the Unicode® Standard.
#Unicode is a registered trademark of Unicode, Inc. in the United States and other countries.
#Reference: Unicode, Inc. 1991-2017. the Unicode Consortium. derived on [2017-08-19] and from: http://www.unicode.org/
#=== global values ===
# - $fPath: target file path
# - $uniSeq: csv formatted hexadecimal sequence as Unicode codepoints
# - $htmlPath: file path in order to html output
#== Unicode character table based on the Unicode Standard ==
# - $unicHexRg: csv formatted a range of Unicode codepoints
##===================================================================
set auto_noexec 1;
package require Tk;
wm title . "tclNote";
#=== namespace: tclNote ===
namespace eval ::tclNote {
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
		#****** (1) file I/O ******
		grid [ttk::frame .fileIO -width 10 -height 2 -borderwidth 1 -relief solid] -column 0 -row 0 -sticky ew;
			grid [ttk::label .fileIO.lbl -text {File path:}] -column 0 -row 0;
			grid [ttk::entry .fileIO.filePath -width 10 -textvariable fPath] -column 1 -row 0;
			grid [ttk::button .fileIO.loadB -text {Open file}] -column 2 -row 0 -padx 5 -pady 2;
			grid [ttk::button .fileIO.saveB -text {Output/Override}] -column 3 -row 0 -padx 5 -pady 2;
			grid [ttk::button .fileIO.saveHtml -text {Output as html}] -column 3 -row 1 -padx 5 -pady 2;
		#****** (2) textarea ******
		grid [tk::text .txtA -width 40 -height 10 -wrap none] -column 0 -row 1 -sticky nw;
		#****** (3) Unicode codepoints sequence input ******
		grid [ttk::frame .unicodeSeq -width 10 -height 1 -borderwidth 1 -relief solid] -column 0 -row 2 -sticky ew;
			grid [ttk::label .unicodeSeq.lbl -text {Unicode codepoints:}] -column 0 -row 0;
			#$uniSeq: csv formatted hexadecimal sequence as Unicode codepoints
			grid [ttk::entry .unicodeSeq.seq -textvariable uniSeq] -column 1 -row 0;
			grid [ttk::button .unicodeSeq.insertB -text {Insert Unicode characters}] -column 0 -row 1 -padx 5 -pady 2;
			#** Unicode table **
			grid [ttk::button .unicodeSeq.tableB -text {Unicode table}] -column 1 -row 1 -padx 5 -pady 2;
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
				set htmlHead "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"utf-8\"><meta name=\"generator\" content=\"tclNote\"><title>tclNote_html</title></head><body><p id=\"pMain\">\n";
				set htmlTail "\n</p><footer>[clock format [clock seconds]]</footer></body></html>";
				::tclNote::fWrite $htmlPath "$htmlHead[regsub -all {\n} [.txtA get 1.0 end] {<br>}]$htmlTail";
			};
			#[Event]: inserting Unicode characters
			.unicodeSeq.insertB configure -command {.txtA insert end [::tclNote::getUnicode $uniSeq];};
			#[Event]: Unicode table based on the Unicode Standard
			.unicodeSeq.tableB configure -command {
				tk::toplevel .uTable;
				wm title .uTable {Unicode character table based on the Unicode Standard};
				#$unicodeBlock: an array that has Unicode block ranges with their block name as index
				#the block names and their ranges are based on the Unicode Standard Version 10.0.0.
				set unicodeBlock(C0_Controls_and_Basic_Latin) {0,7f};set unicodeBlock(C1_Controls_and_Latin-1_Supplement) {80,ff};set unicodeBlock(Latin_Extended-A) {100,17f};set unicodeBlock(Latin_Extended-B) {180,24f};
				set unicodeBlock(IPA_Extensions) {250,2af};set unicodeBlock(Spacing_Modifier_Letters) {2b0,2ff};set unicodeBlock(Combining_Diacritical_Marks) {300,36f};set unicodeBlock(Greek_and_Coptic) {370,3ff};
				set unicodeBlock(Cyrillic) {400,4ff};set unicodeBlock(Cyrillic_Supplement) {500,52f};set unicodeBlock(Armenian) {530,58f};set unicodeBlock(Hebrew) {590,5ff};set unicodeBlock(Arabic) {600,6ff};
				set unicodeBlock(Syriac) {700,74f};set unicodeBlock(Arabic_Supplement) {750,77f};set unicodeBlock(Thaana) {780,7bf};set unicodeBlock(NKo) {7c0,7ff};
				#Table contents
				grid [ttk::frame .uTable.iOFr -borderwidth 1 -relief solid] -column 0 -row 0 -sticky ew;
					grid [ttk::label .uTable.iOFr.lbl -text {Unicode codepoints range:}] -column 0 -row 0;
					#$unicHexRg: csv formatted a range of Unicode codepoints
					grid [ttk::entry .uTable.iOFr.input -width 9 -textvariable unicHexRg] -column 1 -row 0;
					grid [ttk::button .uTable.iOFr.b -text {Get Unicode Table}] -column 2 -row 0 -padx 5 -pady 2;
				grid [tk::text .uTable.hexTable -width 100 -height 10 -wrap word] -column 0 -row 1 -sticky nw;
				grid [ttk::combobox .uTable.cbBox -state readonly] -column 0 -row 2 -sticky ew;
				#default value for the table
				set unicHexRg {0,100};
				.uTable.hexTable insert 1.0 {Unicode Character Table};
				.uTable.cbBox configure -values [lsort [array names unicodeBlock]];
				#[Event]: unicode table; combobox event
				bind .uTable.cbBox <<ComboboxSelected>> {
					set unicHexRg $unicodeBlock([.uTable.cbBox get]);
				};
				#[Event]: Unicode table; table event
				.uTable.iOFr.b configure -command {
					if {[info exists unicHexRg]} {
						set x [split $unicHexRg ,];
						if {[llength [lindex $x 0]]>0&&[llength [lindex $x 1]]>0} {
							.uTable.hexTable delete 1.0 end;
							.uTable.hexTable insert 1.0 [::tclNote::createTable [lindex $x 0] [lindex $x 1]];
						};
					};
				};
			};
		return "\"tclNote\" on Tcl [info tclversion]";
	};
};
::tclNote::run;
