require 'rubygems'
require 'math_engine'

module MathEvaluate
  module Expression
    def self.eql?(correct_answer, response)
      
      begin
        engine = MathEngine.new
      
        y = engine.evaluate("y = " + correct_answer)
        x = engine.evaluate("x = " + response)
  
        #puts "x: #{x}"
        #puts "y: #{y}"
        r = (x - y).abs
              
        return  r < 0.00001
      rescue => e
        puts e
        return false
      end
      
    end
  end
end