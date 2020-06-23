require 'pry'
class CodeBreaker
	COLOURS = ["red", "blue", "green", "yellow", "black", "white"]
	def initialize
		@confirmed_colours = []
		@count = 0 #keep track of current round
	end

	def make_guess
		puts "Please input your guess of four colours with spaces in between each guess"
		guess = gets.chomp.downcase.split
	end

	def computer_make_guess(black, guess)
		for i in 0..(black - 1)
			#add correct number of colours in code to confirmed guess
			@confirmed_colours += [guess[0]]
		end
		if @confirmed_colours.length < 4 
			#as haven't confirmed colours, continue guessing full colours and adding
			#correct colours to confirmed colours
			new_guess = computer_full_colour_guess
			@count += 1
			return new_guess
		else
			return swap_pins(@confirmed_colours)
		end
	end

	def computer_full_colour_guess 
		#guess all 4 pins as same colours to determine which colored pins present
		guess = Array.new(4)
		guess.map{|color| COLOURS[@count]}
	end

	def swap_pins(guess)
		swap1 = rand(3)
		swap2 = rand(3)
		while swap1 == swap2 do
			swap1 = rand(3)
			swap2 = rand(3)
		end
		temp = guess[swap1]
		guess[swap1] = guess[swap2]
		guess[swap2] = temp
		return guess
	end
end