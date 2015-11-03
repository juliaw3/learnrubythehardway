def you_die_again
	puts "An alagator attacks you. You die"
end

def you_might_die
	puts "You lose"
end


def room_one
	puts "You move foward into a big dark rooom."
	puts "There is a door to the right and to the left"
	puts "Would you like to go right or left?"

	print "> "
	choice2 = $stdin.gets.chomp

	if choice2 == "right"
		you_die_again
	elsif choice2 == "left"
		you_might_die
	else
		puts "That was not an option"
		room_one
	end
end

def you_die
	puts "You step off the spachip and die"
end

def start
	puts "You wake up in what appears to be a spaceshuttle"
	puts "There is an exit behind you and a door in front of you"
	puts "Do you want to go forward or backward?"

	print "> "
	choice = $stdin.gets.chomp

	if choice == "forward"
		room_one
	elsif choice == "backward"
		you_die
	else
		puts "That was not an option"
		start
	end

end
start