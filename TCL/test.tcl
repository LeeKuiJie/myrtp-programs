puts "Script name: $argv0"

puts "Number of arguments: $argc"
puts "All arguments: $argv"

if {$argc>1 & $argc <=3} {
	puts "Second argument: [lindex $argv 1]"
	puts "Third argument: [lindex $argv 2]"
}

