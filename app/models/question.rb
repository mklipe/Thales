class Question
  include Mongoid::Document
  field :title
  field :content
  field :correct_answer
  
  belongs_to :exercise
  has_many :last_answers #one last answer for each user
  has_many :answers
  has_many :tips
  has_many :tips_counts  
  
end

