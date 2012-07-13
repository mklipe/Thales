class Question
  include Mongoid::Document
  field :title
  field :content
  field :correct_answer
  
  belongs_to :exercise
end

