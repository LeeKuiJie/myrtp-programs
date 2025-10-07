set fw [open "newbitstream.hex" w]

set fr [open "bitstream.hex" r]

set prevline {}
while { [gets $fr line] >=0} {
	if {[llength $prevline] > 0 } {
		set maskpl [expr 0x$prevline & 0xBF]
		set maskcl [expr 0x$line & 0x40]
		puts $fw [format "%02X" [expr $maskpl | $maskcl]];
	}
	set prevline $line
}
puts $fw $prevline
close $fr
close $fw
