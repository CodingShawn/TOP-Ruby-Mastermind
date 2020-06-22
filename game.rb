require 'pry'
require_relative 'codebreaker'
require_relative 'codemaker'

class Game
	def initialize
		@codebreaker = CodeBreaker.new
		@master_code = ["r","r","y","y"]#CodeMaker.new.make_code
		puts @master_code
	end

	def play_round
		player_guess = @codebreaker.make_guess
		check_guess(player_guess)
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
		puts hint	
	end


end

x = Game.new.play_round