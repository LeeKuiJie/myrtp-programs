#Open file for write mode
set fw [open "newbitstream.hex" w]

#Reading original bistream file line by line
set fr [open "bitstream.hex" r]
set i 1
set each4line {}
while { [gets $fr line] >= 0 } {
	#puts "ORG: $line"
	lappend each4line $line
	if {[expr $i % 4] == 0} {
		set each4line [lreverse $each4line]
		foreach item $each4line {
			puts $fw $item
		}
		#puts $fw {} ; #add newline after every 4 bytes/lines
		set each4line {} ; #reset the list
	}
	incr i
}
close $fr
close $fw
