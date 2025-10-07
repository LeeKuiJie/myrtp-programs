set inputfile [open "test_bar_remap.txt" r]
set editfile [open "test_bar_remap_rev1.txt" w]

set lines [split [read $inputfile] "\n"]
close $inputfile

foreach line $lines {
	if {[string trim $line] eq ""} {
		continue
	}

	if {[regexp {mem_write\(([^,]+),\s*([^,]+),\s*([^)]+)\)} $line -> bar offset data]} {
		set newbar $bar
		regsub {FACE} $newbar FBCE newbar
		regsub {FED} $newbar FEC newbar
		regsub {DACE} $newbar DADE newbar
		regsub {8888} $newbar 9888 newbar

		puts $editfile "mem_write($newbar, $offset, $data)"
	} else {
		puts $editfile $line
	}
}

close $editfile



