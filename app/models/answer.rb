require 'math_evaluate'
#require File.expand_path("../../../lib/math/math_evaluate", __FILE__)

class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  
  include MathEvaluate
  
  belongs_to :user
  belongs_to :question
  belongs_to :last_answer
  
  field :response
  field :correct, type: Boolean
  field :tip
  field :try_number, type: Integer
  
  after_save :verify_response  
  
  def verify_response
    self.correct = MathEvaluate::Expression.eql?(self.question.correct_answer, self.response)
    get_tip if !self.correct 
  end
  
  def get_tip
    self.tip = "Tem algo errado!"
  
    @tips_count = self.question.tips_counts.find_or_create_by(:user_id => self.user.id)
    
    @tips_count.inc(:tries, 1)
    self.try_number = @tips_count.tries
    
    @tips = self.question.tips.where(:number_of_tries.lte => @tips_count.tries)#.max(:number_of_tries)
        
    if !@tips.empty? # Tem alguma dica?
      @matched = Array.new
      @tips.each{ |x| 
        if x.number_of_tries <=  @tips_count.tries # Dica pode ser mostrada
          @matched << x
        end }
        self.tip = @matched.max.content if !@matched.empty? # Melhor dica..
    end
    
  end
  
end
