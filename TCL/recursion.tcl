proc invest_rec {amount rate year} {
	if {$year == 1} {
		return [expr $amount + $amount * $rate/100]
	}
	set prev_inv [invest_rec $amount $rate [expr $year -1] ]
	return [expr $prev_inv + $prev_inv * $rate/100]
}

set amount [lindex $argv 0]
set rate [lindex $argv 1]
set year [lindex $argv 2]

# Call the procedure and store result
set result [invest_rec $amount $rate $year]



# Print the result
puts "Investment result after $year years: $result"


