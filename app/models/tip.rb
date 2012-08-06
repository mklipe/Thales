class Tip
  include Mongoid::Document
  field :content
  field :number_of_tries, type: Integer
  
  belongs_to :question
end
