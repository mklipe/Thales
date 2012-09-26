class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :text
  field :user_email
  field :user_name
  
  belongs_to :user
  embedded_in :answer,  :inverse_of => :comments
end
