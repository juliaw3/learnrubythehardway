print "Give me a number"
number=gets.chomp.to_i

bigger = number * 100
puts "Your number was #{number}. A bigger number is #{bigger}."

print "Give me another number"
another=gets.chomp
number=another.to_i

smaller = number /100
puts "Your number was #{another}. A smaller number is #{smaller}."