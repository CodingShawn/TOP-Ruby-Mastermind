class CodeMaker
    COLOURS = ["Red", "Blue", "Green", "Yellow", "Black", "White"]
    attr_reader :code

    def initialize
        @code = make_code
    end

    def make_code
        code = Array.new(4)
        code.map{|color| COLOURS[rand(5)]}
    end
end

x = CodeMaker.new
puts x.code