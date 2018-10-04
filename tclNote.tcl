#tclNote
#tclNote.tcl
##===================================================================
#	Copyright (c) 2017-2018 Yuji SODE <yuji.sode@gmail.com>
#
#	This software is released under the MIT License.
#	See LICENSE or http://opensource.org/licenses/mit-license.php
##===================================================================
#Unicode codepoints sequence friendly text editor.
#This program is compliant with the Unicode Standard.
#
#Unicode is a registered trademark of Unicode, Inc. in the United States and other countries.
#Reference: Unicode, Inc. 1991-2018. the Unicode Consortium. derived on [2017-08-19 and 2018-08-01] and from: http://www.unicode.org/
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
	#=== variables ===
	# - $fonts: a list of available font families
	variable fonts [lsort -dictionary [font families]];
	# - $unicodeVersion: text description for version of the Unicode Standard
	variable unicodeVersion {};
	# - $unicodeBlock: an array that has Unicode block ranges with their block name as index
	variable unicodeBlock;array set unicodeBlock {};
	#=== loading script for Unicode block list ===
	source -encoding utf-8 ./tclNote_unicodeBlockList.tcl;
	#=== unicodeTcl_proc/unicodeTcl_proc.tcl (Yuji SODE,2017): the MIT License; https://gist.github.com/YujiSODE/688845db196c1c2edfe3dbb88b63478b ===
	#This function returns unicode string using given csv formatted hexadecimal numbers.
	proc getUnicode {codes} {set u [split $codes ,];set L {};foreach el $u {lappend L [subst "\\U$el"];};return [join $L {}];};
	#=== unicodeHexTable/unicodeHexTable.tcl (Yuji SODE,2017): the MIT License; https://gist.github.com/YujiSODE/c47df3cf12a6448c8097628951ace4d4 ===
	#It returns Unicode character table in hexadecimals, based on the Unicode Standard Version 10.0.0-11.0.0.
	proc getHexTable {hex {hex0 0}} {set table {};set v0_1 [subst "0x$hex0"];set v0_2 [subst "0x$hex"];set v1 [expr {$v0_1>$v0_2?$v0_2:$v0_1}];set v2 [expr {$v0_1>$v0_2?$v0_1:$v0_2}];while {$v1<[expr {$v2+1}]} {set h [format %x $v1];lappend table "U+$h:\[[subst "\\U$h"]\]";incr v1 1;};return $table;};
	#=== file I/O functions ===
	#== Parameters ==
 	# - fName: name of a text file or its path
	# - data: string data to output
	#file input
	proc fRead {fName} {
		set X [read -nonewline [set F [open $fName r]]];
		close $F;
		return $X;
	};
	#file output; it overrides the file: fName.
	proc fWrite {fName data} {
		set F [open $fName w];
		puts -nonewline $F $data;
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
		# - $fonts: a list of available font families
		variable fonts;
		# - $unicodeVersion: text description for version of the Unicode Standard
		variable unicodeVersion;
		# - $unicodeBlock: an array that has Unicode block ranges with their block name as index
		variable unicodeBlock;
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
				set htmlTail "\n</p><footer>[clock format [clock seconds] -gmt 1]</footer></body></html>";
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
				.uTable.hexTable insert end "\n#This table is based on the Unicode Standard Version: $::tclNote::unicodeVersion.";
				.uTable.hexTable insert end "\n#Unicode is a registered trademark of Unicode, Inc. in the United States and other countries.";
				.uTable.hexTable insert end "\n#the Unicode Consortium: http:\/\/www.unicode.org\/";
					.uTable.cbBoxLbl.cbBox configure -values [lsort -dictionary [array names ::tclNote::unicodeBlock]];
					.uTable.fontLbl.font configure -values $::tclNote::fonts;
				#[Event]: Unicode table; Unicode block change
				bind .uTable.cbBoxLbl.cbBox <<ComboboxSelected>> {
					set unicHexRg $::tclNote::unicodeBlock([.uTable.cbBoxLbl.cbBox get]);
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
							.uTable.hexTable insert end "\n#This table is based on the Unicode Standard Version: $::tclNote::unicodeVersion.";
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
