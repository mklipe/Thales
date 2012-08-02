class Tip
  include Mongoid::Document
  field :content
  field :try_number
  
  belongs_to :question
end
