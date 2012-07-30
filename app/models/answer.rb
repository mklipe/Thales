require 'math_evaluate'
require 'rubygems'
require 'math_engine'

class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  
  include MathEvaluate
  
  belongs_to :user
  belongs_to :question
  
  field :response
  field :correct, type: Boolean

  after_save :verify_response  
  
  def verify_response
    engine = MathEngine.new
    
    self.correct = MathEvaluate::Expression.eql?(engine.evaluate("y = " + self.question.correct_answer), engine.evaluate("x = " + self.response))
  end
end