class CodeMaker
	COLOURS = ["red", "blue", "green", "yellow", "black", "white"]
	attr_reader :code

	def initialize(game_mode = "codebreaker")
		if game_mode == "codebreaker"
			@code = make_code
		else 
			print "Please input 4 different colours with spaces in between each colour" 
			puts "to set your code!"
			@code = gets.chomp.split
		end	
	end

	def make_code
			code = Array.new(4)
			code.map{|color| COLOURS[rand(5)]}
	end
end