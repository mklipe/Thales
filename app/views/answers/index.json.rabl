collection @answers, object_root: false
attributes :response, :try_number, :correct, :tip, :id

node :created_at do |answer|
	l answer.created_at
end

child :user do
  attributes :email
end

child :comments do
  attributes :text, :id	
end

child :question do
  attributes :title
end