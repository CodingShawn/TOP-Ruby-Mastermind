class CodeMaker
	COLOURS = ["red", "blue", "green", "yellow", "black", "white"]
	attr_reader :code

	def initialize
			@code = make_code
	end

	def make_code
			code = Array.new(4)
			code.map{|color| COLOURS[rand(5)]}
	end
end
