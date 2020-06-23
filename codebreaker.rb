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
		if @confirmed_colours.length < 3 
			for i in 0..(black - 1)
				#add correct number of colours in code to confirmed guess
				@confirmed_colours += [guess[0]]
			end
			#as haven't confirmed colours, continue guessing full colours and adding
			#correct colours to confirmed colours
			new_guess = computer_full_colour_guess
			@count += 1
			return new_guess
		elsif @confirmed_colours.length == 3
			for i in 0..(black - 1)
				#add correct number of colours in code to confirmed guess
				@confirmed_colours += [guess[0]]
				new_guess = computer_determine_order(black, @confirmed_colours)
				return new_guess
			end
			new_guess = computer_full_colour_guess
			@count += 1
			return new_guess
		else
			new_guess = computer_determine_order(black, @confirmed_colours)
			return new_guess
		end
	end

	def computer_full_colour_guess 
		#guess all 4 pins as same colours to determine which colored pins present
		guess = Array.new(4)
		guess.map{|color| COLOURS[@count]}
	end

	def computer_determine_order(black, guess)
		case black
		when 2
			swap_pins(guess)
		when 1
			swap_pins_3_white(guess)
		when 0
			swap_pins_4_white(guess)
		else #won't have 1 black pin only
			guess
		end
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

	def swap_pins_4_white(guess)
		to_swap = [1,2,3] #number of positions for pin 1 to swap to
		swap1 = to_swap[rand(2)] # select a position for pin 1 to swap to
		to_swap -= [swap1] #remaining positions
		#swap pin 1 with selected position
		temp = guess[0] 
		guess[0] = guess[swap1]
		guess[swap1] = temp
		#swap remainining 2 pins
		temp1 = guess[to_swap[0]]
		guess[to_swap[0]] = guess[to_swap[1]]
		guess[to_swap[1]] = temp1
		return guess
	end

	def swap_pins_3_white(guess)
		to_swap = [0,1,2,3] #possible positions of pins
		pin1 = to_swap[rand(3)]
		to_swap -= [pin1] #remaining pins position
		pin2 = to_swap[rand(2)]
		to_swap -= [pin2]
		pin3 = to_swap[rand(1)]
		temp = guess[pin1] #3 way swap, not randomized again as initially already random
		guess[pin1] = guess[pin2]
		guess[pin2] = guess[pin3]
		guess[pin3] = temp
		return guess
	end
end