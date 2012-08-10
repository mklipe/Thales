class LastAnswers
  include Mongoid::Document
    
  has_one :question
  belongs_to :user
  has_one :answers
 
end