object @exercise
attributes :id, :title, :content

child :questions do
  attributes :answers
end

