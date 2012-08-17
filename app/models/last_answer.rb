class LastAnswer
  include Mongoid::Document
  
  belongs_to :question
  belongs_to :user
  belongs_to :answer

end