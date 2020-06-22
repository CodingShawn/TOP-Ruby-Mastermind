class CodeBreaker
	COLOURS = ["red", "blue", "green", "yellow", "black", "white"]
	def initialize
	end

	def make_guess
		puts "Please input your guess of four colours with spaces in between each guess"
		guess = gets.chomp.downcase.split
	end

	def computer_make_guess
		guess = Array.new(4)
		guess.map{|color| COLOURS[rand(5)]}
	end
    
end