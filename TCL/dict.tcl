dict set colours colour1 red
puts $colours
dict set colours colour2 green
puts $colours

set colours [dict create colour1 "black" colour2 "white"]
puts $colours
puts [dict size $colours]

foreach item [dict keys $colours] {
	set value [dict get $colours $item]
	puts $value
}
