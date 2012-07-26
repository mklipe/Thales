require 'math_evaluate'

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
     self.correct= MathEvaluate::Expression.eql?(self.question.correct_answer, self.response)
  end
end