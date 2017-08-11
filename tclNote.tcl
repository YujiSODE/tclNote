#tclNote
#tclNote.tcl
##===================================================================
#	Copyright (c) 2017 Yuji SODE <yuji.sode@gmail.com>
#
#	This software is released under the MIT License.
#	See LICENSE or http://opensource.org/licenses/mit-license.php
##===================================================================
#Unicode codepoints sequence friendly text editor.
#=== global values ===
# - $fPath: target file path
# - $uniSeq: csv formatted hexadecimal sequence as Unicode codepoints
# - $htmlPath: file path in order to html output
##===================================================================
set auto_noexec 1;
package require Tk;
wm title . "tclNote";
#=== namespace: tclNote ===
namespace eval ::tclNote {
	#=== unicodeTcl_proc/unicodeTcl_proc.tcl (Yuji SODE,2017): the MIT License; https://gist.github.com/YujiSODE/688845db196c1c2edfe3dbb88b63478b ===
	#This function returns unicode string using given csv formatted hexadecimal numbers.
	proc getUnicode {codes} {set u [split $codes ,];set L {};foreach el $u {lappend L [subst "\\u$el"];};return [join $L {}];};
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
			grid [ttk::entry .unicodeSeq.seq -textvariable uniSeq] -column 1 -row 0;
			grid [ttk::button .unicodeSeq.insertB -text {Insert Unicode characters}] -column 1 -row 1 -padx 5 -pady 2;
		#****** Events ******
			#Event: loading file
			.fileIO.loadB configure -command {
				.txtA delete 1.0 end;
				.txtA insert 1.0 [::tclNote::fRead $fPath];
			};
			#Event: outputting text
			.fileIO.saveB configure -command {::tclNote::fWrite $fPath [.txtA get 1.0 end];};
			#Event: outputting as html
			.fileIO.saveHtml configure -command {
				#file path in order to html output
				regsub {\.[a-zA-Z0-9_]+$} $fPath {.html} htmlPath;
				set htmlHead "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"utf-8\"><meta name=\"generator\" content=\"tclNote\"><title>tclNote_html</title></head><body><p id=\"pMain\">\n";
				set htmlTail "\n</p><footer>[clock format [clock seconds]]</footer></body></html>";
				::tclNote::fWrite $htmlPath "$htmlHead[regsub -all {\n} [.txtA get 1.0 end] {<br>}]$htmlTail";
			};
			#Event: inserting Unicode characters
			.unicodeSeq.insertB configure -command {.txtA insert end [::tclNote::getUnicode $uniSeq];};
		return "\"tclNote\" on Tcl [info tclversion]";
	};
};
::tclNote::run;
