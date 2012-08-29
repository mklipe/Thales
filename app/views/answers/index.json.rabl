collection @answers, object_root: false
attributes :response, :try_number, :correct, :tip

child :user do
  attributes :email
end

child :question do
  attributes :title
end