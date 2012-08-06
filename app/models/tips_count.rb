class TipsCount
  include Mongoid::Document
  field :tries, type: Integer
  
  belongs_to :question
  belongs_to :user
 
end