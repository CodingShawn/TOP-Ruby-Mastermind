require_relative CodeBreaker, CodeMaker

class Game
	def initialize
		@codebreaker = CodeBreaker.new
		CODE = CodeMaker.new.make_code
	end

	def play_round
		player_guess = @codebreaker.make_guess
	end

	def check_guess



end