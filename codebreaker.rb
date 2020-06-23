require 'pry'
class CodeBreaker
	COLOURS = ["red", "blue", "green", "yellow", "black", "white"]
	def initialize
	end

	def make_guess
		puts "Please input your guess of four colours with spaces in between each guess"
		guess = gets.chomp.downcase.split
	end

	def computer_make_initial_guess
		guess = Array.new(4)
		guess.map{|color| COLOURS[rand(5)]}
	end

	def computer_make_smart_guess(black, white, guess)
		remaining_colour = COLOURS - [guess[rand(3-black-white)]]
		for i in 0..(3-white-black)
			guess[rand(3)] = remaining_colour[rand(remaining_colour.length - 1)]
		end
		case white
		when 1..3
			guess = swap_pins(guess)
		when 4 
			guess = swap_pins(guess)
			guess = swap_pins(guess)
		end
		return guess
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