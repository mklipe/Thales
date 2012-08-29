class LastAnswer
  include Mongoid::Document
  
  belongs_to :question
  belongs_to :user
  belongs_to :answer
  
  scope :by_user, lambda { |user|
    where(:user_id => user.id)
  }
  
end