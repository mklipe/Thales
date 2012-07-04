class Introduction
  include Mongoid::Document
  field :title, :type => String
  field :content, :type => String
  #key :title
  
end
