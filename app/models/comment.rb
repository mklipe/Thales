class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :text
  
  belongs_to :user
  embedded_in :answer,  :inverse_of => :comments
end
