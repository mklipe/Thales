require 'rubygems'
require 'math_engine'

module MathEvaluate
  module Expression
    def self.eql?(correct_answer, response)
      
      engine = MathEngine.new
      
      y = engine.evaluate("y = " + correct_answer)
      x = engine.evaluate("x = " + response)
      
      y == x
    end
  end
end