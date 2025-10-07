proc hextoBin {hexStr} {
	scan $hexStr %x dec

	# Convery decimal to binary string with leading zeros
	
	set bin ""
	for {set i 7} {$i >= 0} {incr i -1} {
		append bin [expr {($dec >> $i) & 1}]
	}
	return $bin
}

proc binToHex {binStr} {
	set dec 0
	for {set i 0} {$i < 8} {incr i} {
		set bit [string index $binStr $i]
		set dec [expr {$dec * 2 + $bit}]
	}
	return [format "%02X" $dec]
}


set inputFile [open "bitstream.hex.org" r]
set outputFile [open "bitstream.hex.modified" w]


set content [read $inputFile]]
close $inputFile 

set lines [split $content "\n"]

set binlist {}
foreach line $lines {
	set hex_val [string toupper [string trim $line]]
	lappend binlist [hextoBin $hex_val]
}

set correct_binlist {}
set len [llength $binlist]

for {set i 0} {$i < $len} {incr i} {
	set current_bin [lindex $binlist $i]

	if {$i < $len - 1} {
		set next_bin [lindex $binlist [expr {$i + 1}]]
		set new_bit2 [string index $next_bin 1]
	} else {
		set new_bit2 [string index $current_bin 1]
	}

	set new_bin [string replace $current_bin 1 1 $new_bit2]

	lappend corrected_binlist $new_bin
}

foreach bin_val $corrected_binlist {
	puts $outputFile [binToHex $bin_val]
}

close $outputFile

puts "Correction done. Output file: bitstream.hex.modified"
