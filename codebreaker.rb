class CodeBreaker

	def initialize
	end

	def make_guess
		puts "Please input your guess of four colours with spaces in between each guess"
		guess = gets.chomp.downcase.split
	end
    
end

x= CodeBreaker.new.make_guess
puts x