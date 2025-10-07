set fileHandler [open "dummy.txt" r]
set allLines [read $fileHandler]
puts $allLines
close $fileHandler


set fileHandler [open "dummy.txt" r]
while {[gets $fileHandler line] >= 0} {
	puts $line
}
close $fileHandler
