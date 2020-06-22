require 'pry'
require_relative 'codebreaker'
require_relative 'codemaker'

class Game
	def initialize(game_mode)
		@codebreaker = CodeBreaker.new(game_mode)
		@master_code = CodeMaker.new.make_code(game_mode)
	end

	def play_game
		puts "Try your best to guess the code of 4 ordered coloured pins! Colours 
					consists of red, blue, green, yellow, black and white!"
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

	def check_guess(player_guess)
		hint = { :black => 0, :white => 0}
		for i in 0..3 #check how many black pins to give
			if @master_code[i] == player_guess[i]
				hint[:black] += 1
				player_guess[i] = ""
			end
		end
		for i in 0..3 #check how many white pins to give
			if @master_code.any? player_guess[i]
				hint[:white] += 1
				player_guess[i] = ""
			end
		end
		return hint	
	end
end

x = Game.new.play_game