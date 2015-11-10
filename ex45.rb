class TicTacToe
	
		puts "Rock Paper or Scisors?"
		puts "> "
		answer = $stdin.gets.chomp
			
		puts "You picked " + answer	

		AI = rand(1..3)

		if AI == 1
		puts "The computer picked rock"
		elsif AI == 2
			puts "The computer picked paper"
		else 
			puts "The computer picked scisors"
		end

		if answer == 'rock' && AI == 1
			puts "Tie."

		elsif answer == 'paper' && AI == 1
			puts "You win"

		elsif answer == 'scisors' && AI == 1
			puts "You lose"

		elsif answer == 'rock' && AI == 2
			puts "You lose"

		elsif answer == 'paper' && AI == 2
			puts "Tie"

		elsif answer == 'scisors' && AI == 2
			puts "You win"

		elsif answer == 'rock' && AI == 3
			puts "You win"

		elsif answer == 'paper' && AI == 3
			puts "You lose"

		elsif answer == 'scisors' && AI == 3
			puts "Tie"
		end
end
