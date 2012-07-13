class Exercise
  include Mongoid::Document
  field :title
  field :content
  key :title
  
  has_many :questions
end
