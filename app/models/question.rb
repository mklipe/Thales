class Question
  include Mongoid::Document
  field :title
  field :content
  field :correct_answer
  
  belongs_to :exercise
  belongs_to :last_answer
  has_many :answers
  has_many :tips
  has_many :tips_counts  
  
end

