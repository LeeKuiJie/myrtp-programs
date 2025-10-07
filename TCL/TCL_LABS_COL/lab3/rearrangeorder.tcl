set inputFile [open "bitstream.hex" r]
set outputFile [open "inverse_bitstream.hex" w]

while {![eof $inputFile]} {
	set block {}
	for {set i 0} {$i < 4} {incr i} {
		if {[gets $inputFile line] >= 0} {
			lappend block $line
		} else {
			break
		}
	}

	set reversedBlock [lreverse $block]
	foreach line $reversedBlock {
		puts $outputFile $line
	}
}

close $inputFile
close $outputFile
