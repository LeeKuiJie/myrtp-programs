proc invest {a b c} {
	
	for {set i 0} {$i < $c} {incr i} {
       		 set interest [expr $a * ($b/100)]
      	  	 set a [expr $interest + $a]
	}
	return $a
}

set a 1000
set b 2.5
set c 2

set result [invest $a $b $c]

puts "Invest $a, with the dividen rate of $b, over $c years, will return $result" 
