class LastAnswer
  include Mongoid::Document
    
  belongs_to :question #question_id
  belongs_to :user #user_id
  belongs_to :answer

end