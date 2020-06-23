require_relative 'codebreaker'
require_relative 'codemaker'

class Game
	attr_reader :score
	def initialize()
		puts "Do you want to play as a codebreaker or codemaker(default option)?"
		game_mode = gets.chomp	
		@codebreaker = CodeBreaker.new
		@master_code = CodeMaker.new(game_mode).code
		@score = 0
		if game_mode == 'codebreaker'
			play_game_codebreaker
		else
			play_game_codemaker
		end
	end

	def play_game_codebreaker
		print "Try your best to guess the code of 4 ordered coloured pins! Colours" 
		puts	" consists of red, blue, green, yellow, black and white!"
		for i in (12).downto(1)
			puts "You have #{i} guesses left!"
			player_guess = @codebreaker.make_guess
			hint = check_guess(player_guess)
			if hint[:black] == 4
				puts "Congratulations! You have guessed the secret code!"
				break
			elsif i > 1
				puts "Here's some hints to help you #{hint}"
				puts "Please make your next guess"
			else
				puts "Oh no. You ran out of tries..."
			end
		end
	end

	def play_game_codemaker
		puts "The computer will now try to guess your code!"
		sleep 0.5
		hint = {}
		computer_guess = []
		for i in (12).downto(1)
			computer_guess = @codebreaker.computer_make_guess(hint[:black] == nil ? 0 : hint[:black], computer_guess)
			print "The computer guessed #{computer_guess[0]}, #{computer_guess[1]}, " 
			puts  "#{computer_guess[2]}, #{computer_guess[3]}"
			sleep 0.7
			hint = check_guess(computer_guess)
			if hint[:black] == 4
				print "The computer guessed right! The code is #{computer_guess[0]}, " 
				puts  "#{computer_guess[1]}, #{computer_guess[2]}, #{computer_guess[3]}"
				break
			elsif i > 1
				puts "Looks like the computer got it wrong..."
				puts "This guess had #{hint[:black]} black pins and #{hint[:white]} white pins"
				sleep 0.5
			else
				puts "Looks like the computer couldn't get it right"
			end	
		end
	end

	def check_guess(guess)
		hint = { :black => 0, :white => 0}
		for i in 0..3 #check how many black pins to give
			if @master_code[i] == guess[i]
				hint[:black] += 1
			end
		end
		guess_hash = guess.inject(Hash.new) do |acc, color|
			if acc.has_key?(color)
				acc[color] += 1	
			else
				acc[color] = 1
			end
			acc
		end
		for i in 0..3 #check how many white pins to give
			if guess_hash.has_key?(@master_code[i]) && guess_hash[@master_code[i]] > 0
				guess_hash[@master_code[i]] -= 1
				hint[:white] += 1
			end
		end
		hint[:white] -= hint[:black]
		return hint	
	end
end

x = Game.new