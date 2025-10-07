proc avg {numbers} {
	set sum 0
	foreach number $numbers {
		set sum [expr $sum + $number]
	}

	set average [expr $sum/[llength $numbers]]
	return $average
}
puts [avg {40 80 50 60}]
